// Imports the untouched CODE resources and models the classic Mac loaded A5 jump table.
// @category RobotWarriors
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.listing.CodeUnit;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.SourceType;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.ByteArrayInputStream;
import java.math.BigInteger;
import com.google.gson.*;

public class PrepareRobotWarriors extends GhidraScript {
  public void run() throws Exception {
    String[] args = getScriptArgs();
    JsonObject map = JsonParser.parseString(Files.readString(Paths.get(args[1]))).getAsJsonObject();
    final long a5 = 0x100000L;
    for (int segment = 2; segment <= 5; segment++) {
      byte[] bytes = Files.readAllBytes(Paths.get(args[0], "CODE_" + segment + ".bin"));
      MemoryBlock block = currentProgram.getMemory().createInitializedBlock("CODE_"+segment, toAddr(segment*0x10000L), new ByteArrayInputStream(bytes), bytes.length, monitor, false);
      block.setRead(true); block.setWrite(false); block.setExecute(true);
    }
    MemoryBlock globals = currentProgram.getMemory().createInitializedBlock("A5_world", toAddr(a5-0x5000), 0x6000, (byte)0, monitor, false);
    globals.setRead(true); globals.setWrite(true); globals.setExecute(true);
    byte[] code0 = Files.readAllBytes(Paths.get(args[0], "CODE_0.bin"));
    currentProgram.getMemory().setBytes(toAddr(a5+0x20), code0, 16, code0.length-16);
    for (JsonElement element : map.getAsJsonArray("jump_table")) {
      JsonObject entry = element.getAsJsonObject();
      int segment=entry.get("segment").getAsInt(), offset=entry.get("resource_offset").getAsInt();
      long target=segment*0x10000L+offset, stub=a5+entry.get("a5_call_offset").getAsInt();
      byte[] bytes={(byte)0x4e,(byte)0xf9,(byte)(target>>24),(byte)(target>>16),(byte)(target>>8),(byte)target};
      currentProgram.getMemory().setBytes(toAddr(stub), bytes);
      disassemble(toAddr(stub));
      createLabel(toAddr(stub), String.format("JT_CODE%d_%04x",segment,offset),true);
      disassemble(toAddr(target));
      createFunction(toAddr(target),String.format("CODE%d_%04x",segment,offset));
    }
    for (JsonElement element : map.getAsJsonArray("segments")) {
      JsonObject segment=element.getAsJsonObject();
      int id=segment.get("id").getAsInt();
      long base=id*0x10000L;
      for(JsonElement candidate: segment.getAsJsonArray("link_candidates")) {
        int offset=candidate.getAsInt();
        // Positive LINK frame sizes here are data, notably the text DIST_CONV at CODE5+2236.
        int frame=currentProgram.getMemory().getShort(toAddr(base+offset+2));
        if(frame>0) { println(String.format("Excluded positive-frame LINK data candidate CODE%d+%04x",id,offset)); continue; }
        Address address=toAddr(base+offset);
        disassemble(address);
        Function f=getFunctionAt(address);
        if(f==null) f=createFunction(address,String.format("CODE%d_%04x",id,offset));
        if(f!=null) f.setComment(String.format("Original CODE %d resource offset 0x%04x (includes four-byte resource header). Candidate from LINK A6 instruction; verify code/data boundary.",id,offset));
      }
      try {
        currentProgram.getProgramContext().setValue(currentProgram.getRegister("A5"),toAddr(base),toAddr(base+segment.get("bytes").getAsInt()-1),BigInteger.valueOf(a5));
      } catch(Exception e) { println("A5 context note: "+e); }
    }
    currentProgram.getListing().setComment(toAddr(a5), CodeUnit.PLATE_COMMENT,"Synthetic A5 base for decompilation. Globals start zero; no startup initialization is assumed. CODE bytes are original; jump-table stubs model loaded segments.");
    Function exit=getFunctionAt(toAddr(0x1007c));
    if(exit!=null) exit.setNoReturn(true);
    println("Prepared Robot Warriors CODE resources and A5 jump table.");
  }
}
