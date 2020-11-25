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
## @deftypefn {} {@var{retval} =} guiyihua (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-24

function [x y coe] = guiyihua (x,y)

mo=sqrt(x.*x+y.*y);
[yy xx]=size(mo);
coe=zeros(yy,xx);
for i = 1:xx,
  for j =1:yy,
    if mo(j,i)>1000,
      mo(j,i)=0;
    end;
  end;
end;
for i = 1:xx,
  for j =1:yy,
    if mo(j,i)~=0,
      coe(j,i)=9/mo(j,i);
      
    end;
  end;
end;

 
      
endfunction
