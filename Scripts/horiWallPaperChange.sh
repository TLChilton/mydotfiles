dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var allDesktops = desktops();
print (allDesktops);
// 2 is the current secondary monitor index
d = allDesktops[2];
d.wallpaperPlugin = "org.kde.image";
d.currentConfigGroup = Array("Wallpaper",
                             "org.kde.image",
                             "General");
d.writeConfig("Image", "file:///home/thomas/Pictures/geometric_wallpaper.jpg");
'
