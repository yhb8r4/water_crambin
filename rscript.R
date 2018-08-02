library(ggplot2)

#ICON = Ilya's Version, Crambin, EFP is ON
#ICOFF = Ilya's Version, Crambin, EFP is OFF
#IWOFF = Ilya's Version, 5 Waters in 30x30 A box, EFP is OFF
#IWON = Ilya's Version, 5 Waters in 30x30 A box, EFP is ON
ICON=read.csv('~/Documents/waterandcrambinrscript/ILYAEFPMDTINKER_crambin_efp_on.csv', header=T)
ICOFF=read.csv('~/Documents/waterandcrambinrscript/ILYAEFPMDTINKER_crambin_efp_off.csv', header=T)
IWON=read.csv('~/Documents/waterandcrambinrscript/ILYAEFPMDTINKER_water_efp_on.csv', header=T)
IWOFF=read.csv('~/Documents/waterandcrambinrscript/ILYAEFPMDTINKER_water_efp_pff.csv', header=T)
#ICON = Yen's Version, Crambin, EFP is ON
#ICOFF = Yen's Version, Crambin, EFP is OFF
#IWOFF = Yen's Version, 5 Waters in 30x30 A box, EFP is OFF
#IWON = Yen's Version, 5 Waters in 30x30 A box, EFP is ON
YCON=read.csv('~/Documents/waterandcrambinrscript/YB_crambin_efp_on.csv', header=T)
YCOFF=read.csv('~/Documents/waterandcrambinrscript/YB_crambin_efp_off.csv', header=T)
YWON=read.csv('~/Documents/waterandcrambinrscript/YB_water_efp_on.csv', header=T)
YWOFF=read.csv('~/Documents/waterandcrambinrscript/YB_water_efp_off.csv', header=T)

CCOFF=read.csv('~/Documents/waterandcrambinrscript/EFPMDCARLOS.csv', header=T)
CCOFF2=read.csv('~/Documents/waterandcrambinrscript/EFPMDCARLOSBEHINDCONSTRAINTS.csv', header=T)
coro4in17A=read.csv('~/Documents/4coro1.7nmNVE.csv',header=T)
gen.energy <- function(x) {
  TIMESTEP<-x$TIMESTEP
  TOTAL <-x$POTENTIAL
  KINETIC <-x$KINETIC
  INVARIANT<-x$INVARIANT
  TITLE <- deparse(substitute(x))
  
  p<-ggplot(x, aes(x=TIMESTEP, y=KINETIC))
  p<- p + geom_line(data=x, aes(x=TIMESTEP,y=KINETIC, color='KINETIC'))
  p<- p + geom_line(data=x, aes(x=TIMESTEP,y=TOTAL, color='POTENTIAL'))
  p<- p + geom_line(data=x, aes(x=TIMESTEP,y=INVARIANT, color='INVARIANT'))
  p<- p + ggtitle(TITLE)
  p<- p + xlab("TIMESTEP (fs)")
  p<- p + ylab("ENERGY (Hartree)")
  #p<- p + xlim(0, 100)
  #p<- p + ylim(-1.5, 75)
  print(p)
  }

gen.temperature <- function(x){
  TIMESTEP<-x$TIMESTEP
  TEMP <- x$TEMPERATURE
  TITLE <- deparse(substitute(x))
  
  p<-ggplot(x, aes(x=TIMESTEP, y=TEMP))
  p<- p + geom_line(data=x, aes(x=TIMESTEP,y=TEMP, color='TEMP'))
  p<- p + ggtitle(TITLE)
  p<- p + xlab("TIMESTEP (fs)")
  p<- p + ylab("TEMPERATURE (K)")
  
  print(p)
}
  
