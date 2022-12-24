function themeList() {
    return [/*{
"'$(
  @($pwd |
    Split-Path |
    Join-Path -ChildPath css |
    Get-ChildItem -Filter *.css |    
    % { $_.Name -replace '\.css$' }
  ) -join "','"
)'"
    }*/]    
}

function feelingLucky() {
    var themes = themeList();
    var randomNumber = Math.floor(Math.random() * themes.length);
    var fourBitCssLink = document.getElementById("4bitcss");
    if (! fourBitCssLink) {
        throw "Must have a stylesheet link with the id '4bitcss'"
    }
    fourBitCssLink.href = "/css/" + themes[randomNumber] + ".css";

    for (arg in arguments) {
        if (arguments[arg].value) {
            arguments[arg].value = themes[randomNumber];
        }
    }
}

function switchTheme(themeName) {
    var fourBitCssLink = document.getElementById("4bitcss");
    if (! fourBitCssLink) {
        throw "Must have a stylesheet link with the id '4bitcss'"
    }
    var foundTheme = themeList().find(element => element == themeName);
    if (! foundTheme) {
        throw ("Theme '" + themeName + "' does not exist");
    }
    fourBitCssLink.href = "/css/" + foundTheme + ".css";
    fourBitCssLink.themeName = foundTheme;
}

function saveTheme() {
    var fourBitCssLink = document.getElementById("4bitcss");
    if (! fourBitCssLink) {
        throw "Must have a stylesheet link with the id '4bitcss'"
    }
    if (typeof(Storage) == "undefined") {
        throw "Cannot save themes without HTML5 Local Storage"
    }

    localStorage.setItem("savedThemeLink", fourBitCssLink.themeName);
}

function loadTheme() {
    if (typeof(Storage) == "undefined") {
        throw "Cannot save themes without HTML5 Local Storage"
    }
    var previouslySaved = localStorage.getItem("savedThemeLink");
    if (previouslySaved) {
        switchTheme(previouslySaved);
    }
    for (arg in arguments) {
        if (arguments[arg].value) {
            arguments[arg].value = previouslySaved;
        }
    }
}