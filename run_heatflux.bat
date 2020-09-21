call "C:\Program Files\blueCFD-Core-2017\\setvars.bat"
set PATH=%HOME%msys64\usr\bin;%PATH%
cd "C:\Users\pkastner\Documents\GitHub\Flux"
postProcess -func grad(T) -region zone_0
postProcess -func grad(T) -region zone_1
postProcess -func grad(T) -region zone_2
postProcess -func grad(T) -region zone_3
postProcess -func grad(T) -region zone_4
postProcess -func grad(T) -region zone_5
postProcess -func grad(T) -region zone_6
postProcess -func grad(T) -region zone_7
postProcess -func grad(T) -region zone_8
postProcess -func grad(T) -region zone_9
postProcess -func grad(T) -region zone_11
postProcess -func grad(T) -region zone_12
postProcess -func grad(T) -region zone_10
postProcess -func grad(T) -region zone_13
"

PAUSE
