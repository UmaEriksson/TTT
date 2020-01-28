%%

x = [5 8];
y = [3 6];
C = [0 2 4 6; 8 10 12 14; 16 18 20 22];

colormap colorcube;

imagesc(x, y, C);
colorscale;

% 1. En bild i matlab är sparad som en matris, i detta fall är det en 3x4
% matris där varje cell representerar ett färgvärde på färgskalan.

% Det ändrar colormap och detta påverkar hur colorscale ser ut. 
% Enligt matlabs dokumentation, it sets the colormap    

%%

clear;
clf;

mask = zeros(16,16);

for n = 1:16
    for m = 1:16
        mask(n,m) = manhat(n,m,9,9);
    end
end

k = 3;
M = ones(16,16);
M = M.*(mask <= k);

figure;
axis image;
colormap gray;
imagesc(mask);

%% 1.4 1

clf;
clear;

load waves.mat;

ftwaves = fft2(waves);

%imagesc(waves);
%imagesc(abs(ftwaves));

%figure;
%axis image;
%imagesc(waves);
%imagesc(abs(ftwaves));

%plot(abs(ftwaves(140,:)))

%shift_ftwaves = fftshift(ftwaves);
%imagesc(abs(shift_ftwaves));

% Short waves delbilden
%figure;
%axis image;

shortwaves = waves(1:16:256, 1:16:256);
%imagesc(shortwaves);
ftshortwaves = fft2(shortwaves);
%imagesc(abs(ftshortwaves));

%plot(abs(ftshortwaves(14,:)));
%figure;
%axis image;
%shit_ftshortwaves = fftshift(ftshortwaves);
%imagesc(abs(shit_ftshortwaves));

va = ifft2(fftshift(fftshift(fft2(shortwaves))));
imagesc(va);

ftshortie = fft2(ftshortwaves);
ftshortie = fftshift(ftshortie);

figure;
axis image;
imagesc(ftshortie);

%% 2

clear;
clf;


load waves.mat;

shortwaves = waves(1:16:256, 1:16:256);
%imagesc(shortwaves);
ftshortwaves = fft2(shortwaves);
ftshortwaves = fftshift(ftshortwaves);

mask = zeros(16,16);

for n = 1:16
    for m = 1:16
        mask(n,m) = manhat(n,m,9,9);
    end
end

for k=0:2
    ftshortwaves0 = ftshortwaves.*(mask <= k);
    rec0 = fft2(fftshift(ftshortwaves0));
    
    subplot(3,1,1);
    imagesc(shortwaves);
    
    subplot(3,1,2);
    imagesc(real(rec0));
    
    subplot(3,1,3);
    imagesc(abs(real(shortwaves)));
    
    pause(0.5);
    
end







