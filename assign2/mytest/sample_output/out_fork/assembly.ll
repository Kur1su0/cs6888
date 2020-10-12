; ModuleID = 'fork.bc'
source_filename = "fork.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @forkexample(i32 %x) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %call = call i32 @fork() #4, !dbg !13
  %cmp = icmp eq i32 %call, 0, !dbg !15
  %0 = load i32, i32* %x.addr, align 4, !dbg !16
  %cmp1 = icmp sgt i32 %0, 5, !dbg !16
  br i1 %cmp, label %if.then, label %if.else3, !dbg !17

if.then:                                          ; preds = %entry
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !18

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !20
  br label %return, !dbg !20

if.else:                                          ; preds = %if.then
  store i32 1, i32* %retval, align 4, !dbg !22
  br label %return, !dbg !22

if.else3:                                         ; preds = %entry
  br i1 %cmp1, label %if.then5, label %if.else6, !dbg !23

if.then5:                                         ; preds = %if.else3
  store i32 1, i32* %retval, align 4, !dbg !25
  br label %return, !dbg !25

if.else6:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

return:                                           ; preds = %if.else6, %if.then5, %if.else, %if.then2
  %1 = load i32, i32* %retval, align 4, !dbg !28
  ret i32 %1, !dbg !28
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @fork() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = bitcast i32* %n to i8*, !dbg !34
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !35
  %1 = load i32, i32* %n, align 4, !dbg !36
  %call = call i32 @forkexample(i32 %1), !dbg !37
  ret i32 %call, !dbg !38
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "fork.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!7 = distinct !DISubprogram(name: "forkexample", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!12 = !DILocation(line: 6, column: 21, scope: !7)
!13 = !DILocation(line: 9, column: 9, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 9)
!15 = !DILocation(line: 9, column: 16, scope: !14)
!16 = !DILocation(line: 0, scope: !14)
!17 = !DILocation(line: 9, column: 9, scope: !7)
!18 = !DILocation(line: 10, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !1, line: 9, column: 21)
!20 = !DILocation(line: 10, column: 10, scope: !21)
!21 = distinct !DILexicalBlock(scope: !19, file: !1, line: 10, column: 5)
!22 = !DILocation(line: 11, column: 7, scope: !21)
!23 = !DILocation(line: 14, column: 6, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 13, column: 9)
!25 = !DILocation(line: 14, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !24, file: !1, line: 14, column: 6)
!27 = !DILocation(line: 15, column: 7, scope: !26)
!28 = !DILocation(line: 17, column: 1, scope: !7)
!29 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !30, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!10}
!32 = !DILocalVariable(name: "n", scope: !29, file: !1, line: 21, type: !10)
!33 = !DILocation(line: 21, column: 9, scope: !29)
!34 = !DILocation(line: 22, column: 24, scope: !29)
!35 = !DILocation(line: 22, column: 5, scope: !29)
!36 = !DILocation(line: 23, column: 24, scope: !29)
!37 = !DILocation(line: 23, column: 12, scope: !29)
!38 = !DILocation(line: 23, column: 5, scope: !29)
