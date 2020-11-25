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
## @deftypefn {} {@var{retval} =} zeroset (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-21

function [x1 y1 nx ny n1x n1y] = zeroset (x,y,x11,x22,y11,y22,px,limit,delta)
n1x=0;
n2x =0;
n1y =0;
n2y =0;
flag=0;
x1 =x;
while x1-ceil(px/2)>=x11,
  n1x=n1x+1;
  x1=x-n1x*delta;
  flag=1;
end;
if flag==1,
  
 n1x=n1x-1;
 else,
 n1x=n1x;
end;
flag=0;
x1 =x;
while x1+ceil(px/2)<=x22,
  n2x=n2x+1;
  x1=x+n2x*delta;
  flag=1;
end;
if flag==1,
  
 n2x=n2x-1;
 else,
 n2x=n2x;
end;
%n2x=n2x-1;

x1 =x-n1x*delta;
nx = n1x +n2x;
flag=0;
y1 =y;
while y1-ceil(px/2)>=y11,
  n1y=n1y+1;
  y1=y-n1y*delta;
  flag=1;
end;
%n1y=n1y-1;
if flag==1,
  n1y=n1y-1;
 else,
 n1y=n1y;
end;

y1 =y;
while y1+ceil(px/2)<=y22,
  n2y=n2y+1;
  y1=y+n2y*delta;
  flag=1;
end;
%n2y=n2y-1;
if flag==1,
  n2y=n2y-1;
 else,
 n2y=n2y;
end;
y1 =y-n1y*delta;
ny = n1y +n2y;
endfunction
