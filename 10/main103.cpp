#include <stdio.h>

extern "C" inline void scaleSSE(float *,float *,int);

int main(void)
{
    float data[400][400],dum[200][200];
    unsigned char header[1078];
    unsigned char ch;
    int N=200,HL=1078;
    int i,j;
    FILE *strm;

    strm=fopen("circle.bmp","rb");
        for(i=0;i<HL;i++) header[i]=fgetc(strm);
        for(i=0;i<N;i++)
        for(j=0;j<N;j++)
            data[i][j]=(float)fgetc(strm);
    fclose(strm);

    for(i=0;i<N/2;i++) scaleSSE(dum[i],data[2*i],N);

    header[4]=0;
    header[3]=160;
    header[2]=118;

    header[18]=200;
    header[19]=0;
    header[22]=200;
    header[23]=0;

    strm=fopen("dum.bmp","wb");
        for(i=0;i<HL;i++) fputc(header[i],strm);
        for(i=0;i<N/2;i++)
        for(j=0;j<N/2;j++)
            fputc((unsigned char)dum[i][j],strm);
    fclose(strm);

}
