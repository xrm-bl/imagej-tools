// Macro: Process Image Sequence and Export as STL Surface
//inputDir = getDirectory("Choose Input Folder (Image Sequence)");
//outputSTL = getDirectory("Choose Output Folder for STL");

//File.openSequence(inputDir);

run("Subtract Background...", "rolling=50 stack"); // Adjust rolling ball size if needed

//setSlice(round(nSlices/2));

//defaultSlice = round(nSlices/2);
//Dialog.create("Select Slice");
//Dialog.addSlider("Slice", 1, nSlices, defaultSlice);
//Dialog.show();
//sliceNum = round(Dialog.getNumber());
//setSlice(sliceNum);

// ---- Slice selection + preview + OK/Cancel ----
defaultSlice = round(nSlices/2);
Dialog.create("Select Slice (Preview)");
Dialog.addSlider("Slice", 1, nSlices, defaultSlice);
Dialog.show();
// ※Cancelされた場合、環境によってはここでマクロが停止します
if (Dialog.wasCanceled()) exit("Canceled by user.");
sliceNum = round(Dialog.getNumber());
setSlice(sliceNum);  // 選んだスライスを表示（プレビュー）
// プレビューを見て続行するか確認（OK/Cancel）
if (!getBoolean("Showing slice " + sliceNum + ".\nContinue processing?")) {
    exit("Canceled by user.");
}
// ----------------------------------------------

setAutoThreshold("Default dark no-reset");
setOption("BlackBackground", true);
run("Convert to Mask", "background=Dark black");

run("3D Viewer");
call("ij3d.ImageJ3DViewer.setCoordinateSystem", "false");
call("ij3d.ImageJ3DViewer.add", getInfo("window.title"), "White", getInfo("window.title"), "50", "true", "true", "true", "2", "2");

//outputDir = getDirectory("STL save");
//output = outputDir + getInfo("window.title") + ".stl";
//call("ij3d.ImageJ3DViewer.exportContent", "STL Binary", output);
