; ModuleID = 'func_call.bc'
source_filename = "func_call.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @helper(i32 %a) #0 !dbg !7 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !11, metadata !DIExpression()), !dbg !12
  ret i32 1, !dbg !13
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %a) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a.addr, align 4, !dbg !17
  %1 = load i32, i32* %a.addr, align 4, !dbg !19
  %call = call i32 @helper(i32 %1), !dbg !20
  %cmp = icmp sgt i32 %0, %call, !dbg !21
  br i1 %cmp, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !24
  br label %return, !dbg !24

return:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !25
  ret i32 %2, !dbg !25
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !26 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = bitcast i32* %a to i8*, !dbg !31
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !32
  %1 = load i32, i32* %a, align 4, !dbg !33
  %call = call i32 @foo(i32 %1), !dbg !34
  ret i32 %call, !dbg !35
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "func_call.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!7 = distinct !DISubprogram(name: "helper", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 16, scope: !7)
!13 = !DILocation(line: 4, column: 2, scope: !7)
!14 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !14, file: !1, line: 9, type: !10)
!16 = !DILocation(line: 9, column: 13, scope: !14)
!17 = !DILocation(line: 10, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !14, file: !1, line: 10, column: 5)
!19 = !DILocation(line: 10, column: 15, scope: !18)
!20 = !DILocation(line: 10, column: 8, scope: !18)
!21 = !DILocation(line: 10, column: 6, scope: !18)
!22 = !DILocation(line: 10, column: 5, scope: !14)
!23 = !DILocation(line: 10, column: 19, scope: !18)
!24 = !DILocation(line: 11, column: 7, scope: !18)
!25 = !DILocation(line: 14, column: 1, scope: !14)
!26 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !27, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!10}
!29 = !DILocalVariable(name: "a", scope: !26, file: !1, line: 17, type: !10)
!30 = !DILocation(line: 17, column: 6, scope: !26)
!31 = !DILocation(line: 19, column: 21, scope: !26)
!32 = !DILocation(line: 19, column: 2, scope: !26)
!33 = !DILocation(line: 20, column: 13, scope: !26)
!34 = !DILocation(line: 20, column: 9, scope: !26)
!35 = !DILocation(line: 20, column: 2, scope: !26)
