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
%高 宽
[h1 w1]=size(img1);
[h2 w2]=size(img2);
%设置选框大小
px=32;
%将画布划分
numx=floor(w1/px);
numy=floor(h1/px);
%这里需要一个函数将点数反推值图像中的坐标 location
%设置一个速度上限，以缩小搜索范围，在本题目当中，通过观察设置搜索范围在100像素*100像素的矩形范围内
limit=64
%这里需要能够通过一个函数将图像中点的坐标以获得四周搜索区域大小的函数









endfunction
