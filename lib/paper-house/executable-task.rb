#
# Copyright (C) 2013 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


require "paper-house/build-task"
require "paper-house/linker-options"


module PaperHouse
  #
  # Compile *.c files into an executable file.
  #
  class ExecutableTask < BuildTask
    include LinkerOptions


    attr_writer :executable_name


    def executable_name
      @executable_name || @name
    end
    alias :target_file_name :executable_name


    ############################################################################
    private
    ############################################################################


    def generate_target
      sh "gcc -o #{ target_path } #{ objects.to_s } #{ gcc_options }"
    end


    def gcc_options
      [ gcc_ldflags, gcc_l_options ].join " "
    end


    def gcc_ldflags
      ldflags.join " "
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
