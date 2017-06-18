clear all;
clc;
function j = proxima_janela(v,indice_atual,tamanho_janela)
  for i = 1:tamanho_janela
    j(i) = v(indice_atual+i-1);
  end
end
function f = bpm(amostras,taxa_amostragem)%gera a freqeuncia em batimentos por minuto (bpm)
  maximo = max(amostras);
  margem = 0.2;
  tam = length(amostras);
  pulsos = 0;
  base = 600;%threshold
  if maximo >=base
    %if mod(tam,3) == 0
    % tam_janela = 15; 
    %else  
    % tam_janela = 20;
    %end
    tam_janela = 10;%como escolher o tamanho da janela de forma adequada?
    for ind = 1:tam_janela:tam
     janela = proxima_janela(amostras,ind,tam_janela);
      maximo_local = max(janela);
      if (maximo_local>=base*(1-margem) ) && (maximo_local <= base*(1+margem) ) 
        pulsos = pulsos + 1
      end 
    end 
  end
  if pulsos > 0
    f = (60*1000)/( (tam/pulsos)*taxa_amostragem );
  else
    f = 0;
  end 
end 

v=[139,150,142,149,143,159,187,136,161,618,611,607,605,563,599,576,521,458,409,362];%teste1(satoru)
plot(v);
freq_v = bpm(v,50)
print("v.png");

v1 =[138,135,135,126,127,149,124,151,134,253,142,139,133,130,134,121,288,686,686,687];%pedro
%%adicionadas 10 amostras (n amostras = 30)
plot(v1);
freq_v1 = bpm(v1,50)
print("v1.png");

v2 = [121,122,122,130,130,132,132,132,132,128,162,385,396,364,326,292,266,243,224,209,139,140,140,140,140,139,139,138,138,138];%pedro
plot(v2);
freq_v2 = bpm(v2,50)
print("v2.png");

v3 = [107,107,111,110,110,110,110,109,110,109,109,110,110,110,108,108,109,108,108,108,108,106,107,106,107,107,106,107,107,107];%satoru
plot(v3);
freq_v3 = bpm(v3,50)
print("v3.png");

v4 = [97,100,99,99,98,94,93,94,93,94,94,95,95,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,93,93];%pedro
plot(v4);
freq_v4 = bpm(v4,50)
print("v4.png");

#n amostras = 60)
v5 = [106,94,91,81,77,85,81,81,73,76,87,87,85,86,87,88,88,88,87,87,88,88,88,88,87,88,88,87,88,89,88,89,88,89,88,88,88,89,88,88,88,87,87,88,87,87,87,87,87,85,86,86,86,86,86,87,87,86,87,86];%pedro
plot(v5);
freq_v5 = bpm(v5,50)
print("v5.png");

v6 = [125,121,125,115,120,198,120,177,186,128,169,176,170,133,599,604,130,191,179,207,187,195,250,211,178,156,172,158,158,405,546,512,442,387,339,294,255,225,184,167,186,182,155,171,162,104,153,156,153,160,161,34,464,135,150,163,140,428,613,172,195,165,53,543,151,155,175,147,370,584,151,417,472,181,169,145,209,202,174,159,196,191,177,204,162,194,345,637,188,189,181,201,177,160,204,194,173,191,207,204,199,155,151,177,201,189,358,637,638,638,611,535,146,154,352,484,463,416,365,328];%pedro
plot(v6);
freq_v6 = bpm(v6,50)
print("v6.png");

v7 = [118,124,116,138,160,154,122,114,114,380,429,399,347,306,271,240,216,186,119,133,120,127,172,123,149,37,155,182,139,148,135,97,154,71,36,112,201,351,690,701,658,583,506,433,128,134,130,95,133,131,141,52,134,172,574,416,537,499,435,379,332,291,257,229,198,186,185,152,140,133,122,120,101,101,95,97,92,96,93,98,93,86,86,89,91,91,75,93,89,86,84,82,81,80,64,78,86,93,89,99,107,137,83,122,126,118,120,105,103,117,117,195,255,238,211,193,179,168,160,147];
plot(v7);
freq_v7 = bpm(v7,50)
print("v7.png");

v8 = [215,187,174,176,180,171,163,161,160,180,258,315,441,596,523,437,366,340,349,402,183,421,234,156,289,200,168,173,186,164,649,159,166,166,168,168,167,161,148,158];
plot(v8);
freq_v8 = bpm(v8,50)
print("v8.png");

v9 = [124,120,136,112,127,130,128,69,122,124,149,141,162,160,154,142,142,130,168,237,671,672,656,589,517,452,399,354,317,286,259,146,146,148,148,149,153,151,150,150];
plot(v9);
freq_v9 = bpm(v9,50)
print("v9.png");

v10 = [111,123,140,126,137,128,117,200,119,228,168,170,196,194,250,226,155,105,73,128,155,146,127,142,172,165,605,173,144,159,174,191,177,186,606,483,171,167,178,144,137,146,146,157,172,164,171,178,185,190,193,208,192,191,176,187,187,185,169,147,174,173,155,149,155,154,168,171,128,135,131,129,129,128,162,167,143,147,148,154,163,173,178,182,177,151,150,144,147,144,141,138,141,136,128,129,127,131,130,127,125,126,123,125,127,119,120,125,124,134,153,544,638,639,639,638,639,631,567,494,430,377,333,297,267,237,221,198,180,172,156,141,139,132,125,117,114,117,109,108,100,125,137,148,153,151,150,156,163,177,182,181,185,193,191,189,189,187,191,168,146,138,142,130,134,133,116,133,120,126,122,124,121,137,145,147,146,143,140,130,120,121,122,113,123,122,115,132,135,142,147,154,158,159,556,638,638,638,616,547];
plot(v10);
freq_v10 = bpm(v10,50)
print("v10.png");

v11 = [265,180,215,173,128,134,144,123,111,660,654,518,656,588,304,131,464,139,375,618,593,523,454,410,357,320,289,267,133,135,146,135,140,112,142,134,136,353,535,514,457,401,353,310,279,249,221,195,176,163,150,140,129,124,115,111,107,103,102,103,101,99,99,100,99,97,98,95,98,101,102,102,96,104,111,101,106,109,100,103,107,105,103,103,102,101,97,102,107,110,108,91,94,95,107,107,106,105,107,106,101,100,104,102,104,103,101,104,105,103,104,98,95,95,96,105,101,101,98,95,100,94,85,95,98,100,88,100,101,106,94,103,108,95,96,98,104,103,98,102,106,107,102,103,107,108,104,111,93,107,104,105,107,108,108,109,113,108,110,110,112,110,112,110,114,113,113,111,109,112,108,104,104,105,104,107,104,104,103,103,105,103,81,100,105,103,103,109,103,102,110,102,106,108,109,110,111,111,106,110];
plot(v11);
freq_v11 = bpm(v11,50)
print("v11.png");

v12 = [682,682,614,275,163,454,471,413,350,309,277,246,215,195,181,167,155,145,137,130,124,118,114,109,105,102,99,99,96,95,90,90,87,86,85,92,87,83,88,92,91,96,98,103,109,90,99,111,104,103,102,107,95,91,95,96,98,96,93,86,101,99,100,96,99,101,100,92,95,95,96,99,97,100,97,99,98,97,100,101,97,103,101,100,97,99,105,105,101,108,111,111,114,115,112,112,117,119,126,126,126,126,125,127,121,130,132,135,134,133,140,138,135,134,132,131,128,131,131,128,128,126,125,124,122,150,662,662,662,662,610,534,463,403,353,312,278,249,227,208,191,177,166,157,149,143,137,132,130,128,125,126,125,123,121,121,119,120,119,117,115,116,116,117,118,134,133,131,131,128,130,124,121,119,140,196,451,456,412,364,322,287,258,233,212,196,182,171,161,153,147,141,135,131,126,128,127,125,126,127];
plot(v12);
freq_v12 = bpm(v12,50)
print("v12.png");

v13 =[149,137,154,145,152,180,162,165,174,156,152,220,154,152,142,141,148,152,159,157,152,149,144,146,144,148,148,150,144,147,144,136,140,139,140,141,142,143,147,144,143,138,135,139,131,135,142,133,138,138,142,142,142,145,147,159,160,154,150,148,144,145,143,140,139,138,137,137,138,140,143,142,138,139,142,142,146,143,140,137,135,135,131,137,138,137,131,133,131,134,135,138,138,142,140,140,140,138,138,137,137,137,137,137,132,130,125,127,124,125,128,131,130,130,127,129,129,127,127,129,128,128,128,127,127,127,127,127,126,126,125,123,124,119,121,120,117,131,131,126,123,115,117,135,143,127,115,118,136,661,662,130,157,119,153,131,123,115,121,121,123,116,119,120,121,122,124,127,128,129,129,127,127,124,129,128,127,126,128,127,128,128,128,129,131,132,132,130,133,131,133,132,132,131,127,128,128,131,127,129];
%t = 0:50/1000:2999;
plot(v13);
freq_v13 = bpm(v13,50)
print("v13.png");