// @category RobotWarriors
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.data.*;
import ghidra.program.model.symbol.SourceType;
import java.nio.file.Files;
import java.nio.file.Paths;

public class RecoverPascal extends GhidraScript {
  public void run() throws Exception {
    int count=0;
    for(String line:Files.readAllLines(Paths.get(getScriptArgs()[0]))) {
      if(line.startsWith("segment")) continue;
      String[] fields=line.split("\t");
      int segment=Integer.parseInt(fields[0]), offset=Integer.parseInt(fields[1]), jump=Integer.parseInt(fields[2]), purge=Integer.parseInt(fields[3]), resultOffset=Integer.parseInt(fields[4]), resultSize=Integer.parseInt(fields[5]);
      Instruction ret=getInstructionAt(toAddr(segment*0x10000L+jump));
      if(ret==null) { disassemble(toAddr(segment*0x10000L+jump)); ret=getInstructionAt(toAddr(segment*0x10000L+jump)); }
      if(ret!=null) ret.setFlowOverride(FlowOverride.RETURN);
      Function function=getFunctionAt(toAddr(segment*0x10000L+offset));
      if(function!=null) {
        function.setStackPurgeSize(purge);
        if(resultSize>0) {
          DataType type=resultSize==1?ByteDataType.dataType:resultSize==2?ShortDataType.dataType:LongDataType.dataType;
          function.setCustomVariableStorage(true);
          function.setReturn(type,new VariableStorage(currentProgram,resultOffset,resultSize),SourceType.USER_DEFINED);
        }
        count++;
      }
    }
    // CODE1+0x007c ends with ExitToShell; application startup tail-calls it.
    Function exit=getFunctionAt(toAddr(0x1007c));
    if(exit!=null) exit.setNoReturn(true);
    println("Applied "+count+" Pascal epilogue annotations; original CODE bytes unchanged.");
  }
}
