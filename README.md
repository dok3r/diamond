# diamond
Dockerized diamond

# Examples

Run docker:

```
docker run -it dok3r/diamond
```

# Usage

Simple example (if your license is in /host/fpga dir):
```
docker run -it -v /host/fpga:/fpga -e LM_LICENSE_FILE=/fpga/license.dat dok3r/diamond
```





