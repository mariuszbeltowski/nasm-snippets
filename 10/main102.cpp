#include <stdio.h>
#include <math.h>

//Na wyjściu: grad[i] = sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2) 
// dla i=0,1,...,N-2 
extern "C" void gradientSSE(float *grad, float * data, int N);

int main(void)
{
    float data[400][400],header[1078];
    unsigned char ch;
    float grad[400][400],sq;
    int N=400,HL=1078;
    int i,j;
    FILE *strm;

    strm=fopen("circle.bmp","rb");
        for(i=0;i<HL;i++) header[i]=fgetc(strm);
        for(i=0;i<N;i++)
        for(j=0;j<N;j++)
            data[i][j]=(float)fgetc(strm);
    fclose(strm);

    for(i=1;i<N-1;i++)
        gradientSSE(grad[i]+1,data[i]+1,N);
    
    strm=fopen("dum.bmp","wb");
        for(i=0;i<HL;i++) fputc(header[i],strm);
        for(i=0;i<N;i++)
        for(j=0;j<N;j++)
            fputc((unsigned char)grad[i][j],strm);
    fclose(strm);
            
}
