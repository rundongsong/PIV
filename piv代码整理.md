```octave
function [u v] = main (img11,img22)
##Flip Picture
img1=flip(img11);
img2=flip(img22);
##divide picuture into many tiny parts
[numx numy h1 w1 h2 w2 px limit] = setData (img1,img2);
##create v-matrix and u-matrix
v = zeros(numy,numx);
u = zeros(numy,numx);
##set delta when searching in search window
delta =1;
##set Rlimit to filter the too little R
Rlimit=0.4;
##scan point in every part
for xx =1:numx,
##show rate of progress
  xx/numx 
  for yy = 1:numy,
##get central coordinate
    [x y]=location(xx,yy,px);
##range size is obtained from the center coordinates
    [x1 x2 y1 y2] = range_location (x,y,px);
##obtain the range
    f=img1(y1:y2,x1:x2);
##search window's range size is obtained from the center coordinates
    [x11 x22 y11 y22] = locaton_search (x,y,limit);
##get the change range in the search window  
    [x0 y0 nx ny n1x n1y] = zeroset (x,y,x11,x22,y11,y22,px,limit,delta);
##create R-matrix  
   R=zeros(ny+1,nx+1);
##scan point by point
    for i = 1:nx+1,
      for j= 1:ny+1,
##get central coordinate
        xs=x0+(i-1)*delta;
        ys=y0+(j-1)*delta;
##range size is obtained from the center coordinates
        [sx1 sx2 sy1 sy2]=range_location (xs,ys,px);
##obtain the range        
        g=img2(sy1:sy2,sx1:sx2);
##calculate the correlation between the two matrices        
        R(j,i)=corr2(f,g);
      end;
    end;
 ##the abscissa and ordinate of the maximum correlation are obtained
    [c iy]=max(R);
    [Rvalue ix]=max(c);
    iy1 = iy (1,ix);
##screening to remove the situation of low correlation
    if Rvalue>Rlimit,
##calculate u and v
    [uvalue vvalue]=VelocityVector(n1x+1,n1y+1,ix,iy1);
    u(yy,xx)=uvalue.*delta;
    v(yy,xx)=vvalue.*delta;
    else,
     u(yy,xx)=0.;
    v(yy,xx)=0.;

  end;

  end;
end;
##save the data
save zhongjiu.txt u;
save zhongjiv.txt v;
endfunction
```

```octave
function [numx numy h1 w1 h2 w2 px limit] = setData (img1,img2)
##得到图像的宽和高
[h1 w1]=size(img1);
[h2 w2]=size(img2);
##设置分解小块的大小
px=32;
##将图像进行划分
numx=floor(w1/px);
numy=floor(h1/px);
##设置搜索框的大小
limit=64
endfunction
```

```octave
function [x y] = location (numx, numy,px)
##由小块的序号值推及中心坐标值
x = (1+px)/2+(numx-1)*px;
y = (1+px)/2+(numy-1)*px;
endfunction
```

```octave
function [x1 x2 y1 y2] = range_location (x,y,px)
##由中心坐标以及小块的大小确定四个边的位置
x1=ceil(x)-px/2;
x2 = x1 +px -1;
y1=ceil(y)-px/2;
y2 = y1 +px -1;
endfunction
```

```octave
function [x1 x2 y1 y2] = locaton_search (x,y,limit)
##由中心坐标以及搜索框的大小确定四个边的位置
x1=ceil(x)-limit/2;
x2 = x1 +limit -1;
y1=ceil(y)-limit/2;
y2 = y1 +limit -1;
##防止超出图像范围
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
```

```octave
function [x1 y1 nx ny n1x n1y] = zeroset (x,y,x11,x22,y11,y22,px,limit,delta)
##在搜索窗范围内得到最左上角的坐标值，以及记录回退次数
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
```

```octave
function r = corr2 (a,b)
##计算二维矩阵的相关性
c=sqrt(sum(sum(a.*a))*sum(sum(b.*b)));
a = a - mean2(a);
 b = b - mean2(b);
##处理当有一组全为0时的特殊情况
 if c~=0,
 r = sum(sum(a.*b))/c;
 else,
 r=0;
end;
endfunction
```

```octave
function [u v] = VelocityVector (x1 , y1 , x2 , y2)
##计算得出u v的数值
  t=1;
  u = (x2-x1)./t;
  v = (y2-y1)./t;
endfunction
```

```octave
function [u v] = preprocessing()
##导入图像
I1 = imread('i1.tif');
I2 = imread('i2.tif');
##基于otsu算法计算level
level = graythresh(I1);
##对图像进行二元化处理，增强对比度
BW1 = im2bw(I1,level);
BW2 = im2bw(I2,level);
endfunction
```

