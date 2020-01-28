clear;

ORIGIM = imread('pez.jpg');
ORIGIM = double(ORIGIM);

SFFTIMAGE = complex(zeros(size(ORIGIM)));
for k  = 1:16:size(ORIGIM,1)-15
 for m = 1:16:size(ORIGIM,2)-15
  SFFTIMAGE(k:k+15,m:m+15)=fftshift(fft2(ORIGIM(k:k+15,m:m+15)));
 end
end

% Create mask
mask = zeros(16,16);
for n = 1:16
    for m = 1:16
        mask(n,m) = manhat(n,m,9,9);
    end
end

RECIMAGE = zeros(256, 256);

for mthres = 1:max(mask(:))+1
 for k  = 1:16:size(ORIGIM,1)-15
  for m = 1:16:size(ORIGIM,2)-15

    subimage = SFFTIMAGE(k:k+15, m:m+15);
    subimage0 = subimage.*(mask <= mthres);
    rec0 = ifft2(fftshift(subimage0));
    RECIM = real(rec0);

    RECIMAGE(k:k+15,m:m+15) = abs(RECIM);
  end
 end
 figure(1);imagesc(ORIGIM)
 figure(2);imagesc(RECIMAGE);
 drawnow
 pause(1);
end