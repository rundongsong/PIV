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
## @deftypefn {} {@var{retval} =} premodified (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-23

function [u v] = premodified (u, v)
[yy xx]=size(u);
for j = 1:1,
  for i = 2:yy-1,
    A=[0 0;9999 0;0 0;];
    C=A.+(u(i-1:i+1,j:j+1).*u(i-1:i+1,j:j+1)+v(i-1:i+1,j:j+1).*v(i-1:i+1,j:j+1));
    n=sum(sum(C==0));
    if n~=5,
    aveu(i,j)=1/(5-n)*(u(i-1,j)+u(i+1,j)+u(i-1,j+1)+u(i+1,j+1)+u(i,j+1));
    avev(i,j)=1/(5-n)*(v(i-1,j)+v(i+1,j)+v(i-1,j+1)+v(i+1,j+1)+v(i,j+1));
    moaveu=sqrt(aveu(i,j).*aveu(i,j).+avev(i,j).*avev(i,j));
    else,
    aveu(i,j)=0;
    avev(i,j)=0;
    moaveu=0;
    end;
    mov=sqrt(u(i,j).*u(i,j).+v(i,j).*v(i,j));
    if mov==0&&n<=1,
      u(i,j)=aveu(i,j);
      v(i,j)=avev(i,j); 
      continue;
    end;
    if mov==0||moaveu==0,
      continue;
      else,
    ratio=moaveu/mov;
    aveuv=aveu(i,j)*u(i,j)+avev(i,j)*v(i,j);
    costheta=aveuv/moaveu/mov;
    if costheta<0.866,
      u(i,j)=aveu(i,j);
      v(i,j)=avev(i,j);
    end;
    if ratio>1.2||ratio<0.8,
      u(i,j)=aveu(i,j);
      v(i,j)=avev(i,j);
      end;
    end;
  end;
end;

    
    
    
    
endfunction
