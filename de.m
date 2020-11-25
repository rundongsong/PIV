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
## @deftypefn {} {@var{retval} =} de (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-23

function [u v] = de (u, v)
[yy xx]=size(u);
for j = 2:xx-1,
  for i = 2:yy-1,
    
##    mutiaveu=u(i-1,j-1)*u(i,j-1)*u(i+1,j-1)*u(i-1,j)*u(i+1,j)*u(i-1,j+1)*u(i,j+1)*u(i+1,j+1);
##    mutiavev=v(i-1,j-1)*v(i,j-1)*v(i+1,j-1)*v(i-1,j)*v(i+1,j)*v(i-1,j+1)*v(i,j+1)*v(i+1,j+1);
    A=[0 0 0;0 9999 0;0 0 0;];
    C=A.+(u(i-1:i+1,j-1:j+1).*u(i-1:i+1,j-1:j+1)+v(i-1:i+1,j-1:j+1).*v(i-1:i+1,j-1:j+1));
    n=sum(sum(C==0));
    if n~=8,
    aveu(i,j)=1/(8-n)*(u(i-1,j-1)+u(i,j-1)+u(i+1,j-1)+u(i-1,j)+u(i+1,j)+u(i-1,j+1)+u(i,j+1)+u(i+1,j+1));
    avev(i,j)=1/(8-n)*(v(i-1,j-1)+v(i,j-1)+v(i+1,j-1)+v(i-1,j)+v(i+1,j)+v(i-1,j+1)+v(i,j+1)+v(i+1,j+1));
    moaveu=sqrt(aveu(i,j).*aveu(i,j).+avev(i,j).*avev(i,j));
    else,
    aveu(i,j)=0;
    avev(i,j)=0;
    moaveu=0;
    end;
    mov=sqrt(u(i,j).*u(i,j).+v(i,j).*v(i,j));
    if j<=20,
      if mov~=0&&n>=4,
      u(i,j)=0;
      v(i,j)=0; 
      continue;
      end,
      else,
    if mov~=0&&n>=5,
      u(i,j)=0;
      v(i,j)=0; 
      continue;
     end;
     end;
   
  end;
end;
endfunction
