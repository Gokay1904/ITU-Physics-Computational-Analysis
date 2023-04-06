t = [];
x = 0;
w = 15; %% I defined omega as 15

sampling_rate = 100;

t(1) = 0;

for i=2:1000
    t(i) = t(i-1) + (1/(sampling_rate));
end


signal= cos(2*pi*w*t);


% There is a normal cosine wave with frequency w(omega) = 15

fft_signal = fft(signal);
    
fftshift_signal = fftshift(fft_signal);

shifted_frequency_mtx = [];
shifted_frequency_mtx(1) = -500;
for i=2:length(t)
    shifted_frequency_mtx(i) = (i-(length(t)/2));
end

shifted_frequency_mtx =  shifted_frequency_mtx *(100/(length(signal)));



subplot(2,1,1)
plot(t,signal,'-b');
xlabel("time")
ylabel("signal")

subplot(2,1,2)
plot(shifted_frequency_mtx,abs(fftshift_signal),"-r");
xlabel("shifted frequency (time)");
ylabel("shifted signal");

% There is a single sided amplitude spectrum of the signal between the positive and negative sides
% of shifted_frequency_mtx.
