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


require "paper-house/shared-library-task"


module PaperHouse
  describe PaperHouse::SharedLibraryTask, %{.new( :libtest, "0.1.0" )} do
    subject { PaperHouse::SharedLibraryTask.new :libtest, "0.1.0" }

    its( :name ) { should eq "libtest" }
    its( :version ) { should eq "0.1.0" }
    its( :target_directory ) { should eq "." }
    its( :sources ) { should be_empty  }
    its( :cflags ) { should be_empty }
    its( :includes ) { should be_empty }
  end


  describe PaperHouse::SharedLibraryTask, %{.new( :libtest )} do
    it "should raise an error if :version option is missing" do
      expect {
        PaperHouse::SharedLibraryTask.new "libtest"
      }.to raise_error( ":version option is a mandatory." )
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
