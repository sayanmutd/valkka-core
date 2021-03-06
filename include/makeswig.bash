#!/bin/bash
#
# extract everything that we want to expose in python
#

echo
echo GENERATING valkka_core.i
echo

headers="thread.h framefifo.h framefilter.h threadsignal.h livethread.h filethread.h fileframefilter.h avthread.h openglthread.h openglframefifo.h sharedmem.h logging.h constant.h avdep.h testthread.h framefilterset.h"

# init valkka_core.i
cat valkka.i.base > valkka_core.i

for header in $headers
do
  grep -h "<pyapi>" $header | awk '{if ($1=="class" || $1=="enum" || $1=="struct") {print " "}; print $0}' >> valkka_core.i
done

