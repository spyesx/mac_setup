# Convert RAW to JPG

[source](https://drewlustro.com/blog/batch-convert-raw-images-to-jpeg-with-imagemagick-in-parallel)

## Get some basic libs

```bash
brew install pkg-config cmake glib zlib libtool
```

## RAW support

```bash
brew install libpng jpeg libtiff dcraw little-cms exiv2
brew install ufraw --with-exiv2

## ImageMagick with extras

```bash
brew install freetype little-cms2 webp
brew install imagemagick --with-webp
```

## Make sure everything installed correctly

```bash
which convert && which ufraw-batch
# You should see:
/usr/local/bin/convert
/usr/local/bin/ufraw-batch
```

## Use

```bash
find . -type f -iname '*.CR2' -print0 | xargs -0 -n 1 -P 8 -I {} convert -verbose -units PixelsPerInch {} -colorspace sRGB -resize 2560x2650 -set filename:new '%t-%wx%h' -density 72 -format JPG -quality 80 '%[filename:new].jpg'
```

## Script

You can copy and paste `./convert_raw_to_jpg.sh` to your `~/.bashrc` or `~/.bash_profile` file to make use immediately.