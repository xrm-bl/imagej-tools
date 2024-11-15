// Get the input path from the command-line argument
args = getArgument();

if (indexOf(args, "@") != -1) {
    argsArray = split(args, "@");
} else {indexOf(args, ":") != -1
    argsArray = split(args, ":");
}

//print(args)

input = File.getAbsolutePath(argsArray[0]); // First argument: input path

// Initialize start and end to defaults
start = 0;
end = 0;

// virtual stack option default
virtualstack = "no";

// If start and end numbers and virtual stack option are provided, parse them
if (lengthOf(argsArray) == 2)  {
    virtualstack = "yes";
}
if (lengthOf(argsArray) == 3)  {
    start = parseInt(argsArray[1]);
    end = parseInt(argsArray[2]);
}
if (lengthOf(argsArray) == 4)  {
    start = parseInt(argsArray[1]);
    end = parseInt(argsArray[2]);
    virtualstack = "yes";
}

// Check if the input path exists
if (File.exists(input)) {
    if (File.isDirectory(input)) {
        // If input is a directory, get the list of files
        fileList = getFileList(input);
        
        // Sort the fileList lexicographically
        Array.sort(fileList);
        
        if (lengthOf(fileList) == 1) {
            // If there is only one file, open it
            singleFile = input + File.separator + fileList[0];
            open(singleFile);
        } else if (lengthOf(fileList) > 1) {
           
            // If there are multiple files, load as sequence
            if (start > 0 && end > 0) {
                // Load a specific range
                numberofinput = end - start + 1;
                if (virtualstack == "no") {
                    run("Image Sequence...", "open=[" + input + "] number=" + numberofinput + " starting=" + start + " increment=1" + " sort");
                } else {
                run("Image Sequence...", "open=[" + input + "] number=" + numberofinput + " starting=" + start + " increment=1" + " sort use");
                    }
                
            } else {
                // Load the entire sequence
                if (virtualstack == "no") {
                    run("Image Sequence...", "open=[" + input + "] sort");
                } else {
                run("Image Sequence...", "open=[" + input + "] sort use");    
                }
            }

        } else {
            // Directory is empty
            print("Error: The directory is empty.");
            exit();
        }
        
    } else {
        // If input is a single file, open it
        open(input);
    }
} else {
    // Handle cases where the input path is invalid
    print("Error: The specified path does not exist.");
    exit();
}
