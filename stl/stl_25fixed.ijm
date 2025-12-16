// Macro: Process Image Sequence and Export as STL Surface
//inputDir = getDirectory("Choose Input Folder (Image Sequence)");
//outputSTL = getDirectory("Choose Output Folder for STL");

//File.openSequence(inputDir);

run("Subtract Background...", "rolling=50 stack"); // Adjust rolling ball size if needed

setSlice(round(nSlices/2));
setThreshold(25, 255);
setOption("BlackBackground", true);
run("Convert to Mask", "background=Dark black");

run("3D Viewer");
call("ij3d.ImageJ3DViewer.setCoordinateSystem", "false");
call("ij3d.ImageJ3DViewer.add", getInfo("window.title"), "White", getInfo("window.title"), "50", "true", "true", "true", "2", "2");

//outputDir = getDirectory("STL save");
//output = outputDir + getInfo("window.title") + ".stl";
//call("ij3d.ImageJ3DViewer.exportContent", "STL Binary", output);
