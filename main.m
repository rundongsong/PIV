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
## @deftypefn {} {@var{retval} =} main (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ddbb <ddbb@DESKTOP-H95R2HK>
## Created: 2020-11-20

function [u v] = main (img11,img22)
##[img1 img2]=LoadPicture();
img1=flip(img11);
img2=flip(img22);
[numx numy h1 w1 h2 w2 px limit] = setData (img1,img2);
##u = zeros(h1,w1);
####v = zeros(h1,w1);
v = zeros(numy,numx);
u = zeros(numy,numx);
%R = zeros(limit,limit);
delta =1;
Rlimit=0.4;
for xx =1:numx,
  xx/numx%��ʾ����
  for yy = 1:numy,
    %�õ���������
    [x y]=location(xx,yy,px);
    %����������õ�ȡ���С
    [x1 x2 y1 y2] = range_location (x,y,px);
    %ѡȡ���������
    f=img1(y1:y2,x1:x2);
    %����������õ�������Ĵ�С
    [x11 x22 y11 y22] = locaton_search (x,y,limit);
    %������Ҫһ�������õ������������Ͻǵ�һ�����꣬�Լ�������̻��˶��ٴ� ����zeroset
    [x0 y0 nx ny n1x n1y] = zeroset (x,y,x11,x22,y11,y22,px,limit,delta);
    R=zeros(ny+1,nx+1);
    for i = 1:nx+1,
      for j= 1:ny+1,
        xs=x0+(i-1)*delta;
        ys=y0+(j-1)*delta;
        %������zeroset����һЩ���⣬�������Ͻ��Լ����ϵı߽�����ò�����ȷ��  �����
        %���ݵõ��İ뾶������Χ
        [sx1 sx2 sy1 sy2]=range_location (xs,ys,px);
        g=img2(sy1:sy2,sx1:sx2);
        R(j,i)=corr2(f,g);
        
      end;
    end;
    %�к��е����⻹Ҫϸ��һ��
    R(isnan(R)==1)=0;
    [c iy]=max(R);
    [Rvalue ix]=max(c);
    iy1 = iy (1,ix);
    %ɸ�����͵�R
    if Rvalue>Rlimit,
    [uvalue vvalue]=VelocityVector(n1x+1,n1y+1,ix,iy1);
    u(yy,xx)=uvalue.*delta;
    v(yy,xx)=vvalue.*delta;
    else,
     u(yy,xx)=0.;
    v(yy,xx)=0.;
  end;
  
  end;
end;
save zhongjiu.txt u;
save zhongjiv.txt v;
        













##for x1 = 16:16:2032,
##  x1/2032
## for y1 = 16:16:2032,
##    for i = 16:16:2032,
##      for j = 16:16:2032,
##        R(i,j)=FFTCrossCorrelation(x1,y1,i,j,img1,img2);
##        
##      end;
##    end;
##    [x ix]=max(R);
##    [y iy]=max(x);
##    ix1 = ix (1,iy);
##    [uvalue vvalue]=VelocityVector(x1,y1,ix1,iy);
##    u(x1,y1)=uvalue;
##    v(x1,y1)=vvalue;
##   end;
## end;
 
endfunction
