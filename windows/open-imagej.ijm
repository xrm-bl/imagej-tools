// Get the input path from the command-line argument
input = getArgument();

// Convert input to an absolute path
input = File.getAbsolutePath(input);

// Check if the input path exists
if (File.exists(input)) {
    // Check if the input is a directory
    if (File.isDirectory(input)) {
        // Load the directory as an image sequence
        run("Image Sequence...", "open=[" + input + "] sort");
    } else {
        // If the input is a file, open the single image
        open(input);
    }
} else {
    // Handle cases where the input path is invalid
    print("Error: The specified path does not exist.");
    exit();
}

// Optional: Save the stack (or single image) as a TIFF file
//output = input + "_output.tif";
//run("Save", "save=[" + output + "]");
