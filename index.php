<?php
$path = "/dest";
if (!is_dir($path)) {
    mkdir($path, 0777, true);
}

function copy(string $src, string $dest) : void {
    if (is_dir($src)) {
        mkdir($dest);
        foreach (scandir($src) as $fileName) {
            if ($fileName !== '.' && $fileName !== '..') {
                copy("$src/$fileName", "$dest/$fileName");
            }
        }
    } else {
        touch($dest);
        file_put_contents($dest, file_get_contents($src));
    }
}

copy("/app/templates", $path);
