## Copyright (C) 2020 ddbb
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} modified (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-22

function [u v] = modified (u, v)
[numy numx]=size(u);
for i =2:numx-1,
  for j = 2:numy-1,
    if (u(i-1,j)*u(i+1,j)>0.)&& (u(i-1,j)*u(i,j)<0.),
      u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1));
      v(i,j)=0.25*(v(i-1,j)+v(i+1,j)+v(i,j-1)+v(i,j+1));
    end;
    if (u(i,j-1)*u(i,j+1)>0.)&& (u(i,j-1)*u(i,j)<0.),
      u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1));
      v(i,j)=0.25*(v(i-1,j)+v(i+1,j)+v(i,j-1)+v(i,j+1));
    end;
  end;
end;

endfunction
