disp('Introduzca el valor de todas las variables en unidades del S.I');

m1 = input('Introduzca la masa 1: ');
m2 = input('Introduzca la masa 2: ');
mp = input('Introduzca la masa de la polea: ');
rp = input('Introduzca el radio de la polea: ');
x0 = input('Introduzca el valor de x inicial: ');
v0 = input('Introduzca la velocidad inicial: ');
l = input('Introduzca la longitud de la cuerda: ');
fps = input('Introduzca el frame-rate: ');
VideoName = input('Introduzca el nombre del archivo de video, sin formato: ', 's');

t = 0;
i = 1;
x = x0;

a = ((m1 - m2) * 9.81) / (m1 + m2 + (mp / 2));

disp('La aceleracion es de');
disp(a);
disp('m/s^2');

while x > 0 & x < l;
    tlist(i) = t;
    x(i) = x0 + (v0 * t) + (0.5 * a * (t^2));
    i = i + 1;
    t = t + (1 / fps);
end

ymax = l + ((53 / 20) * rp);

figure

Frames(length(x) - 1) = struct('cdata',[],'colormap',[]);
Frames(length(x):length(Frames)) = [];

for i = 1:(length(x) - 1)
    pbaspect([6 * rp, 1.25 * ymax, 1]);
    viscircles([3 * rp, ymax - ((7 / 4) * rp); 2 * rp, ymax - (x(i) + rp + ((3 / 4) * rp)); 4 * rp, ymax - ((l  - x(i)) + rp + ((3 / 4) * rp)) ], [rp; (2 / 5) * rp; (2 / 5) * rp]);
    line([3 * rp, 3* rp], [ymax, ymax - ((3 / 4) * rp)]);
    line([2 * rp, 2 * rp], [ymax - ((7 / 4) * rp), ymax - (x(i) + rp + ((7 / 20) * rp))]);
    line([4 * rp, 4 * rp], [ymax - ((7 / 4) * rp), ymax - ((l - x(i)) + rp + ((7 / 20) * rp))]);
    xlim([0, 6 * rp]);
    ylim([0, ymax]);
    
    
    
    Frames(i) = getframe(gcf);
    clf;
end

Framesvid = [Frames, Frames, Frames, Frames, Frames, Frames, Frames, Frames];

myVideo = VideoWriter(strcat(VideoName, '.avi'));
myVideo.FrameRate = fps;
myVideo.Quality = 100; 
open(myVideo);
writeVideo(myVideo, Framesvid);
close(myVideo);

disp('El vídeo de la animación se ha guardado en el mismo directorio que contiene este código.');
    