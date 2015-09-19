#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

"""Custom OTA commands for cancro devices"""

import common
import os

TARGET_DIR = os.getenv('OUT')

def FullOTA_Assertions(info):
 
 info.output_zip.write(os.path.join(TARGET_DIR, "removenfc.sh"), "removenfc.sh")

def FullOTA_PostValidate(info):

 info.script.AppendExtra(
  ('ui_print("Resizing file system...");\n'
   'run_program("/sbin/e2fsck", "-fy", "/dev/block/platform/msm_sdcc.1/by-name/system");\n'
   'run_program("/sbin/resize2fs", "/dev/block/platform/msm_sdcc.1/by-name/system");\n'
   'run_program("/sbin/e2fsck", "-fy", "/dev/block/platform/msm_sdcc.1/by-name/system");'))

def FullOTA_InstallEnd(info):

 info.script.AppendExtra(
  ('mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "/system", "");\n'
   'package_extract_file("removenfc.sh", "/tmp/removenfc.sh");\n'
   'set_metadata("/tmp/removenfc.sh", "uid", 0, "gid", 0, "mode", 0755);\n'
   'ui_print("Removing NFC for Mi4...");\n'
   'run_program("/tmp/removenfc.sh");\n'
   'unmount("/system");'))
