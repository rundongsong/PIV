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
## @deftypefn {} {@var{retval} =} test1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-19

function [u v] = test1 ()
[img1 img2]=LoadPicture();
x1 = 16;
y1 = 1280;
R = zeros(2048,2048);
for i = 16:16:2032,
  for j = 16:16:2032,
    R(i,j)=FFTCrossCorrelation(x1,y1,i,j,img1,img2);
    j
  end;
end;
[x ix]=max(R);
[y iy]=max(x);
ix1 = ix (1,iy);
[u v]=VelocityVector(x1,y1,ix1,iy);
endfunction
