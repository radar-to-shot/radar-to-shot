// Exports genuine Ghidra decompiler output, retaining warnings and original CODE offsets.
// @category RobotWarriors
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.listing.Function;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.PrintWriter;

public class ExportRobotWarriors extends GhidraScript {
  public void run() throws Exception {
    String out=getScriptArgs()[0];
    Files.createDirectories(Paths.get(out));
    DecompInterface decompiler=new DecompInterface();
    decompiler.openProgram(currentProgram);
    int count=0, failures=0;
    try(PrintWriter index=new PrintWriter(Paths.get(out,"index.tsv").toFile())) {
      index.println("segment\toffset\tfunction\tstatus");
      for(int segment=1;segment<=5;segment++) {
        try(PrintWriter writer=new PrintWriter(Paths.get(out,"CODE_"+segment+".c").toFile())) {
          writer.println("/* Ghidra 11.3.2 decompiler output. Analysis aid, not reconstructed original source. */");
          writer.println("/* Synthetic addresses: CODE n at n*0x10000; A5=0x100000. */");
          writer.println("/* Original bytes retained. Pascal stack ABI and Toolbox calls may be unresolved. */\n");
          for(Function function: currentProgram.getFunctionManager().getFunctions(true)) {
            long address=function.getEntryPoint().getOffset();
            if(address<segment*0x10000L || address>=(segment+1)*0x10000L) continue;
            DecompileResults result=decompiler.decompileFunction(function,60,monitor);
            writer.printf("\n/* CODE %d + 0x%04x, synthetic address 0x%08x */\n",segment,address-segment*0x10000L,address);
            String status=result.decompileCompleted()?"decompiled":"failed";
            index.printf("%d\t0x%04x\t%s\t%s\n",segment,address-segment*0x10000L,function.getName(),status);
            if(result.decompileCompleted()) { writer.println(result.getDecompiledFunction().getC()); count++; }
            else { writer.println("/* DECOMPILATION FAILED: "+result.getErrorMessage()+" */"); failures++; }
          }
        }
      }
    }
    decompiler.dispose();
    println("Exported "+count+" functions; "+failures+" failed.");
  }
}
