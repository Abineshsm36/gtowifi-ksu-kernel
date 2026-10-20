set -e
source ~/kernel/gtowifi-ksu-kernel/env.sh
cd ~/kernel/kernel-gtowifi
make O=out olddefconfig
make O=out CC=clang -j$(nproc) 2>&1 | tee ~/build.log
cp out/arch/arm64/boot/Image.gz-dtb ~/kernel/AnyKernel3/
cd ~/kernel/AnyKernel3
rm -f ~/gtowifi-kernel.zip
zip -r9 ~/gtowifi-kernel.zip * -x .git
echo "Done: ~/gtowifi-kernel.zip"
