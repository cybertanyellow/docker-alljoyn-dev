
target_dir=$1
mkdir $target_dir/uncrustify # for example
cd $target_dir/uncrustify
git clone http://github.com/bengardner/uncrustify.git
# or use
#git clone git://uncrustify.git.sourceforge.net/gitroot/uncrustify/uncrustify
cd uncrustify
git checkout uncrustify-0.57
./configure --prefix=$target_dir
patch -p1 <<EOF
diff --git a/src/uncrustify.cpp b/src/uncrustify.cpp
index 2635189..7aba76d 100644
--- a/src/uncrustify.cpp
+++ b/src/uncrustify.cpp
@@ -32,6 +32,7 @@
#ifdef HAVE_STRINGS_H
#include <strings.h>  /* strcasecmp() */
#endif
+#include <unistd.h>

 /* Global data */
 struct cp_data cpd;
EOF
make install

