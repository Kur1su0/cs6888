; ModuleID = 'binary_tree.bc'
source_filename = "binary_tree.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node*, %struct.node* }

@.str = private unnamed_addr constant [6 x i8] c"array\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.node* @newNode(i32 %item) #0 !dbg !16 {
entry:
  %item.addr = alloca i32, align 4
  %temp = alloca %struct.node*, align 8
  store i32 %item, i32* %item.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %item.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %struct.node** %temp, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !23
  %0 = bitcast i8* %call to %struct.node*, !dbg !24
  store %struct.node* %0, %struct.node** %temp, align 8, !dbg !22
  %1 = load i32, i32* %item.addr, align 4, !dbg !25
  %2 = load %struct.node*, %struct.node** %temp, align 8, !dbg !26
  %key = getelementptr inbounds %struct.node, %struct.node* %2, i32 0, i32 0, !dbg !27
  store i32 %1, i32* %key, align 8, !dbg !28
  %3 = load %struct.node*, %struct.node** %temp, align 8, !dbg !29
  %right = getelementptr inbounds %struct.node, %struct.node* %3, i32 0, i32 2, !dbg !30
  store %struct.node* null, %struct.node** %right, align 8, !dbg !31
  %4 = load %struct.node*, %struct.node** %temp, align 8, !dbg !32
  %left = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 1, !dbg !33
  store %struct.node* null, %struct.node** %left, align 8, !dbg !34
  %5 = load %struct.node*, %struct.node** %temp, align 8, !dbg !35
  ret %struct.node* %5, !dbg !36
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.node* @insert(%struct.node* %node, i32 %key) #0 !dbg !37 {
entry:
  %retval = alloca %struct.node*, align 8
  %node.addr = alloca %struct.node*, align 8
  %key.addr = alloca i32, align 4
  store %struct.node* %node, %struct.node** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.node** %node.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 %key, i32* %key.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %key.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !44
  %cmp = icmp eq %struct.node* %0, null, !dbg !46
  %1 = load i32, i32* %key.addr, align 4, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  %call = call %struct.node* @newNode(i32 %1), !dbg !49
  store %struct.node* %call, %struct.node** %retval, align 8, !dbg !50
  br label %return, !dbg !50

if.end:                                           ; preds = %entry
  %2 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !51
  %key1 = getelementptr inbounds %struct.node, %struct.node* %2, i32 0, i32 0, !dbg !53
  %3 = load i32, i32* %key1, align 8, !dbg !53
  %cmp2 = icmp slt i32 %1, %3, !dbg !54
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !55

if.then3:                                         ; preds = %if.end
  %4 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !56
  %left = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 1, !dbg !57
  %5 = load %struct.node*, %struct.node** %left, align 8, !dbg !57
  %6 = load i32, i32* %key.addr, align 4, !dbg !58
  %call4 = call %struct.node* @insert(%struct.node* %5, i32 %6), !dbg !59
  %7 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !60
  %left5 = getelementptr inbounds %struct.node, %struct.node* %7, i32 0, i32 1, !dbg !61
  store %struct.node* %call4, %struct.node** %left5, align 8, !dbg !62
  br label %if.end12, !dbg !60

if.else:                                          ; preds = %if.end
  %8 = load i32, i32* %key.addr, align 4, !dbg !63
  %9 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !65
  %key6 = getelementptr inbounds %struct.node, %struct.node* %9, i32 0, i32 0, !dbg !66
  %10 = load i32, i32* %key6, align 8, !dbg !66
  %cmp7 = icmp sgt i32 %8, %10, !dbg !67
  br i1 %cmp7, label %if.then8, label %if.end12, !dbg !68

if.then8:                                         ; preds = %if.else
  %11 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !69
  %right = getelementptr inbounds %struct.node, %struct.node* %11, i32 0, i32 2, !dbg !70
  %12 = load %struct.node*, %struct.node** %right, align 8, !dbg !70
  %13 = load i32, i32* %key.addr, align 4, !dbg !71
  %call9 = call %struct.node* @insert(%struct.node* %12, i32 %13), !dbg !72
  %14 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !73
  %right10 = getelementptr inbounds %struct.node, %struct.node* %14, i32 0, i32 2, !dbg !74
  store %struct.node* %call9, %struct.node** %right10, align 8, !dbg !75
  br label %if.end12, !dbg !73

if.end12:                                         ; preds = %if.else, %if.then8, %if.then3
  %15 = load %struct.node*, %struct.node** %node.addr, align 8, !dbg !76
  store %struct.node* %15, %struct.node** %retval, align 8, !dbg !77
  br label %return, !dbg !77

return:                                           ; preds = %if.end12, %if.then
  %16 = load %struct.node*, %struct.node** %retval, align 8, !dbg !78
  ret %struct.node* %16, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %root = alloca %struct.node*, align 8
  %array = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.node** %root, metadata !82, metadata !DIExpression()), !dbg !83
  store %struct.node* null, %struct.node** %root, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [5 x i32]* %array, metadata !84, metadata !DIExpression()), !dbg !88
  %0 = bitcast [5 x i32]* %array to i8*, !dbg !89
  call void @klee_make_symbolic(i8* %0, i64 20, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !90
  %1 = load %struct.node*, %struct.node** %root, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %array, i64 0, i64 0, !dbg !92
  %2 = load i32, i32* %arrayidx, align 16, !dbg !92
  %call = call %struct.node* @insert(%struct.node* %1, i32 %2), !dbg !93
  store %struct.node* %call, %struct.node** %root, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i32 1, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.body, %entry
  %3 = load i32, i32* %i, align 4, !dbg !99
  %cmp = icmp slt i32 %3, 5, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %4 = load %struct.node*, %struct.node** %root, align 8, !dbg !103
  %5 = load i32, i32* %i, align 4, !dbg !105
  %idxprom = sext i32 %5 to i64, !dbg !106
  %arrayidx1 = getelementptr inbounds [5 x i32], [5 x i32]* %array, i64 0, i64 %idxprom, !dbg !106
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !106
  %call2 = call %struct.node* @insert(%struct.node* %4, i32 %6), !dbg !107
  %7 = load i32, i32* %i, align 4, !dbg !108
  %inc = add nsw i32 %7, 1, !dbg !108
  store i32 %inc, i32* %i, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !112
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, nameTableKind: None)
!1 = !DIFile(filename: "binary_tree.c", directory: "/home/klee/share")
!2 = !{}
!3 = !{!4, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !1, line: 5, size: 192, elements: !6)
!6 = !{!7, !9, !10}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !5, file: !1, line: 7, baseType: !8, size: 32)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !5, file: !1, line: 8, baseType: !4, size: 64, offset: 64)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !5, file: !1, line: 8, baseType: !4, size: 64, offset: 128)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!16 = distinct !DISubprogram(name: "newNode", scope: !1, file: !1, line: 10, type: !17, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !8}
!19 = !DILocalVariable(name: "item", arg: 1, scope: !16, file: !1, line: 10, type: !8)
!20 = !DILocation(line: 10, column: 26, scope: !16)
!21 = !DILocalVariable(name: "temp", scope: !16, file: !1, line: 12, type: !4)
!22 = !DILocation(line: 12, column: 15, scope: !16)
!23 = !DILocation(line: 12, column: 37, scope: !16)
!24 = !DILocation(line: 12, column: 22, scope: !16)
!25 = !DILocation(line: 13, column: 14, scope: !16)
!26 = !DILocation(line: 13, column: 2, scope: !16)
!27 = !DILocation(line: 13, column: 8, scope: !16)
!28 = !DILocation(line: 13, column: 12, scope: !16)
!29 = !DILocation(line: 14, column: 15, scope: !16)
!30 = !DILocation(line: 14, column: 21, scope: !16)
!31 = !DILocation(line: 14, column: 27, scope: !16)
!32 = !DILocation(line: 14, column: 2, scope: !16)
!33 = !DILocation(line: 14, column: 8, scope: !16)
!34 = !DILocation(line: 14, column: 13, scope: !16)
!35 = !DILocation(line: 15, column: 9, scope: !16)
!36 = !DILocation(line: 15, column: 2, scope: !16)
!37 = distinct !DISubprogram(name: "insert", scope: !1, file: !1, line: 17, type: !38, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!4, !4, !8}
!40 = !DILocalVariable(name: "node", arg: 1, scope: !37, file: !1, line: 17, type: !4)
!41 = !DILocation(line: 17, column: 34, scope: !37)
!42 = !DILocalVariable(name: "key", arg: 2, scope: !37, file: !1, line: 17, type: !8)
!43 = !DILocation(line: 17, column: 44, scope: !37)
!44 = !DILocation(line: 19, column: 6, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !1, line: 19, column: 6)
!46 = !DILocation(line: 19, column: 11, scope: !45)
!47 = !DILocation(line: 0, scope: !37)
!48 = !DILocation(line: 19, column: 6, scope: !37)
!49 = !DILocation(line: 19, column: 27, scope: !45)
!50 = !DILocation(line: 19, column: 20, scope: !45)
!51 = !DILocation(line: 20, column: 12, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !1, line: 20, column: 6)
!53 = !DILocation(line: 20, column: 18, scope: !52)
!54 = !DILocation(line: 20, column: 10, scope: !52)
!55 = !DILocation(line: 20, column: 6, scope: !37)
!56 = !DILocation(line: 21, column: 23, scope: !52)
!57 = !DILocation(line: 21, column: 29, scope: !52)
!58 = !DILocation(line: 21, column: 35, scope: !52)
!59 = !DILocation(line: 21, column: 16, scope: !52)
!60 = !DILocation(line: 21, column: 3, scope: !52)
!61 = !DILocation(line: 21, column: 9, scope: !52)
!62 = !DILocation(line: 21, column: 14, scope: !52)
!63 = !DILocation(line: 22, column: 11, scope: !64)
!64 = distinct !DILexicalBlock(scope: !52, file: !1, line: 22, column: 11)
!65 = !DILocation(line: 22, column: 17, scope: !64)
!66 = !DILocation(line: 22, column: 23, scope: !64)
!67 = !DILocation(line: 22, column: 15, scope: !64)
!68 = !DILocation(line: 22, column: 11, scope: !52)
!69 = !DILocation(line: 23, column: 24, scope: !64)
!70 = !DILocation(line: 23, column: 30, scope: !64)
!71 = !DILocation(line: 23, column: 37, scope: !64)
!72 = !DILocation(line: 23, column: 17, scope: !64)
!73 = !DILocation(line: 23, column: 3, scope: !64)
!74 = !DILocation(line: 23, column: 9, scope: !64)
!75 = !DILocation(line: 23, column: 15, scope: !64)
!76 = !DILocation(line: 24, column: 9, scope: !37)
!77 = !DILocation(line: 24, column: 2, scope: !37)
!78 = !DILocation(line: 25, column: 1, scope: !37)
!79 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 26, type: !80, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!8}
!82 = !DILocalVariable(name: "root", scope: !79, file: !1, line: 28, type: !4)
!83 = !DILocation(line: 28, column: 15, scope: !79)
!84 = !DILocalVariable(name: "array", scope: !79, file: !1, line: 29, type: !85)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 160, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 5)
!88 = !DILocation(line: 29, column: 6, scope: !79)
!89 = !DILocation(line: 30, column: 21, scope: !79)
!90 = !DILocation(line: 30, column: 2, scope: !79)
!91 = !DILocation(line: 31, column: 16, scope: !79)
!92 = !DILocation(line: 31, column: 22, scope: !79)
!93 = !DILocation(line: 31, column: 9, scope: !79)
!94 = !DILocation(line: 31, column: 7, scope: !79)
!95 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 32, type: !8)
!96 = distinct !DILexicalBlock(scope: !79, file: !1, line: 32, column: 2)
!97 = !DILocation(line: 32, column: 10, scope: !96)
!98 = !DILocation(line: 32, column: 6, scope: !96)
!99 = !DILocation(line: 32, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 32, column: 2)
!101 = !DILocation(line: 32, column: 15, scope: !100)
!102 = !DILocation(line: 32, column: 2, scope: !96)
!103 = !DILocation(line: 33, column: 10, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 32, column: 24)
!105 = !DILocation(line: 33, column: 22, scope: !104)
!106 = !DILocation(line: 33, column: 16, scope: !104)
!107 = !DILocation(line: 33, column: 3, scope: !104)
!108 = !DILocation(line: 32, column: 21, scope: !100)
!109 = !DILocation(line: 32, column: 2, scope: !100)
!110 = distinct !{!110, !102, !111}
!111 = !DILocation(line: 35, column: 2, scope: !96)
!112 = !DILocation(line: 36, column: 2, scope: !79)
