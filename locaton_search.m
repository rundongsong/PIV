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
## @deftypefn {} {@var{retval} =} locaton_search (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-21

function [x1 x2 y1 y2] = locaton_search (x,y,limit)
x1=ceil(x)-limit/2;
x2 = x1 +limit -1;
y1=ceil(y)-limit/2;
y2 = y1 +limit -1;
if x1<1,
  x1=1;
end;
if y1<1,
  y1=1;
end;
if x2>2048,
  x2=2048;
end;
if y2>2048,
  y2=2048;
end;
endfunction