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
## @deftypefn {} {@var{retval} =} setData (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-21

function [numx numy h1 w1 h2 w2 px limit] = setData (img1,img2)
%�� ��
[h1 w1]=size(img1);
[h2 w2]=size(img2);
%����ѡ���С
px=32;
%����������
numx=floor(w1/px);
numy=floor(h1/px);
%������Ҫһ����������������ֵͼ���е����� location
%����һ���ٶ����ޣ�����С������Χ���ڱ���Ŀ���У�ͨ���۲�����������Χ��100����*100���صľ��η�Χ��
limit=64
%������Ҫ�ܹ�ͨ��һ��������ͼ���е�������Ի���������������С�ĺ���









endfunction
