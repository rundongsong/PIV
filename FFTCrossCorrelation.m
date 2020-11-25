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
## @deftypefn {} {@var{retval} =} FFTCrossCorrelation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-19

function Rnumber = FFTCrossCorrelation (x1 , y1 , x2 , y2, img1 , img2 )
%¿òÑ¡Êý¾Ý·¶Î§
f = img1(x1-15:x1+16, y1-15: y1+16 );
g = img2(x2-15:x2+16, y2-15: y2+16 );
F = fft (f);
G = fft (g);
X = conj (F)* G;
R = ifft (X);
Rnumber = sum(sum(abs(R)));
endfunction
