; ModuleID = 'rec.bc'
source_filename = "rec.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f(i32 %n) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %n.addr, align 4, !dbg !13
  %cmp = icmp eq i32 %0, 0, !dbg !15
  %1 = load i32, i32* %n.addr, align 4, !dbg !16
  %cmp1 = icmp eq i32 %1, 1, !dbg !17
  %or.cond = or i1 %cmp, %cmp1, !dbg !18
  br i1 %or.cond, label %if.then, label %if.else, !dbg !18

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !19
  br label %return, !dbg !19

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !20
  %3 = load i32, i32* %n.addr, align 4, !dbg !21
  %sub = sub nsw i32 %3, 1, !dbg !22
  %call = call i32 @f(i32 %sub), !dbg !23
  %mul = mul nsw i32 %2, %call, !dbg !24
  store i32 %mul, i32* %retval, align 4, !dbg !25
  br label %return, !dbg !25

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !26
  ret i32 %4, !dbg !26
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 5, i32* %n, align 4, !dbg !31
  %0 = bitcast i32* %n to i8*, !dbg !32
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !33
  %1 = load i32, i32* %n, align 4, !dbg !34
  %call = call i32 @f(i32 %1), !dbg !35
  ret i32 %call, !dbg !36
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "rec.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 11, scope: !7)
!13 = !DILocation(line: 8, column: 9, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 9)
!15 = !DILocation(line: 8, column: 11, scope: !14)
!16 = !DILocation(line: 8, column: 19, scope: !14)
!17 = !DILocation(line: 8, column: 21, scope: !14)
!18 = !DILocation(line: 8, column: 16, scope: !14)
!19 = !DILocation(line: 9, column: 9, scope: !14)
!20 = !DILocation(line: 13, column: 16, scope: !14)
!21 = !DILocation(line: 13, column: 22, scope: !14)
!22 = !DILocation(line: 13, column: 24, scope: !14)
!23 = !DILocation(line: 13, column: 20, scope: !14)
!24 = !DILocation(line: 13, column: 18, scope: !14)
!25 = !DILocation(line: 13, column: 9, scope: !14)
!26 = !DILocation(line: 14, column: 1, scope: !7)
!27 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !28, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!10}
!30 = !DILocalVariable(name: "n", scope: !27, file: !1, line: 19, type: !10)
!31 = !DILocation(line: 19, column: 9, scope: !27)
!32 = !DILocation(line: 20, column: 24, scope: !27)
!33 = !DILocation(line: 20, column: 5, scope: !27)
!34 = !DILocation(line: 21, column: 14, scope: !27)
!35 = !DILocation(line: 21, column: 12, scope: !27)
!36 = !DILocation(line: 21, column: 5, scope: !27)
