#
# local.mk
#
# This source file is part of the FoundationDB open source project
#
# Copyright 2013-2018 Apple Inc. and the FoundationDB project authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# -*- mode: makefile; -*-

fdbrpc_BUILD_SOURCES += fdbrpc/libeio/eio.c

fdbrpc_CFLAGS := -isystem$(BOOSTDIR) -I. -Ifdbrpc/libeio -DUSE_UCONTEXT
fdbrpc_LDFLAGS :=

ifeq ($(PLATFORM),osx)
  fdbrpc_CFLAGS += -fasynchronous-unwind-tables -fno-omit-frame-pointer
  fdbrpc_BUILD_SOURCES += fdbrpc/libcoroutine/asm.S fdbrpc/libcoroutine/context.c
  fdbrpc_LDFLAGS += -framework CoreFoundation -framework IOKit
endif

lib/libfdbrpc.a: bin/coverage.fdbrpc.xml
