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

// ---- Slice selection + preview + confirm loop ----
defaultSlice = round(nSlices/2);
sliceNum = defaultSlice;

while (true) {
    // 1) スライス選択（スライダー）
    Dialog.create("Select Slice (Preview)");
    Dialog.addSlider("Slice", 1, nSlices, sliceNum);
    Dialog.show();
    if (Dialog.wasCanceled()) exit("Canceled by user.");

    sliceNum = round(Dialog.getNumber());

    // 2) プレビュー表示
    setSlice(sliceNum);

    // 3) 続行するか（戻る/中止を含めて）確認
    Dialog.create("Confirm");
    Dialog.addMessage("Showing slice " + sliceNum + ".\nWhat would you like to do?");
    Dialog.addChoice("Action", newArray("Continue", "Reselect slice", "Cancel"), "Continue");
    Dialog.show();
    if (Dialog.wasCanceled()) exit("Canceled by user.");

    action = Dialog.getChoice();
    if (action == "Continue") {
        break; // ループを抜けて後続処理へ
    } else if (action == "Cancel") {
        exit("Canceled by user.");
    }
    // action == "Reselect slice" の場合は while(true) で先頭に戻る
}
// -----------------------------------------------

setAutoThreshold("Default dark no-reset");
setOption("BlackBackground", true);
run("Convert to Mask", "background=Dark black");

run("3D Viewer");
call("ij3d.ImageJ3DViewer.setCoordinateSystem", "false");
call("ij3d.ImageJ3DViewer.add", getInfo("window.title"), "White", getInfo("window.title"), "50", "true", "true", "true", "2", "2");

//outputDir = getDirectory("STL save");
//output = outputDir + getInfo("window.title") + ".stl";
//call("ij3d.ImageJ3DViewer.exportContent", "STL Binary", output);
