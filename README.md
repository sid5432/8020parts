# 8020parts


## Introduction

There are some [Openscad](https://www.openscad.org/) models for 
[8020.net](https://8020.net/) parts.

There are [design files](https://8020.net/downloads/index/designfiles) available
for from the 8020.net website, but nothing directly available for Openscad. For
just the aluminum extrusions, you can download the 2D DXF profiles (see
[this imgur post](https://imgur.com/gallery/0NdA7) for example). however, it appears
that not all the DXF files import correctly (for example, I was unable to get
the 8016 profile to work with Openscad. For those that did work, I sometimes 
had trouble exporting it into STL files that worked with 
[Freecad](https://www.freecadweb.org) or 
[SolidWorks](https://www.solidworks.com).

But besides these problems, there are no models that I could find for some of
the other 8020 parts. The natural thing to do was of course to just roll my own. 

The aluminum extrusions are based the DXF files; the other parts are based on
the drawings and descriptions from the 8020 catalogs. I have tried to make these
as accurate as possible, according to my understanding of the parts. But there
may be errors, so use at your own risk!

## Installation

The ".scad" files should be placed in the Openscad library path, in a 8020 folder.
For Linux, this would be in

	$HOME/.local/share/OpenSCAD/libraries/8020/

## Mock-Up Mode

A full rendering of the exact profile of the extrusions and
details of the parts can be time consuming as your models become more 
complicated. For many applications, this is not
necessary, especially in the initial design stage. The models in
these files will look at the variable **G8020FAKE**; if this variable is set
to "false", the fake/mock-up pieces will be used instead the detailed models.

	openscad -D G8020FAKE=true mymodel.scad

In addtion, if you only care about the exterior of the extrusions, and don't 
ever need to look at the interior cut-outs (particularly if you are covering
the ends of the extrusions anyway), then you can set the variable
**G8020OUTERONLY** to "true" to skip over the interior details:

	openscad -D G8020OUTERONLY=true mymodel.scad


(*last revised 2020-12-20*)

