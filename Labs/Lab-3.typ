#import "Class.typ": *


#show: ieee.with(
  title: [#text(smallcaps("Lab #3: Web Application with Genie"))],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
  

    
    (
      name: "Belkhamsa Ayhem",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "Ayhem99",
    ),
    

  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

= Exercise
In this lab, we will create a basic web application using *Genie* framework in Julia. The application will allow us to control the behaviour of a sine wave, given some adjustble parameters. 

#exo[Sine Wave Control][We provide the Julia and HTML codes to build and run a Sinewave Dashboard. This dashboard allows you to manipulate various parameters of a sine wave and visualize the results.

 Here’s a brief explanation of each component:

Samples: This slider adjusts the number of samples used to generate the sine wave. The range is from 10 to 1000, with steps of 10.


Amplitude: This slider adjusts the amplitude of the sine wave. The range is from 0 to 3, with steps of 0.5.

Frequency: This slider adjusts the frequency of the sine wave. The range is from 0 to 10, with steps of 1.


Offset: This slider adjusts the offset of the sine wave. The range is from -3.141 to 3.141, with steps of 1.


Phase: This slider adjusts the phase of the sine wave. The range is from -0.5 to 1, with steps of 0.1.


The Sinewave section at the bottom displays the generated sine wave based on the parameters set above.

 The plotly component is used for this visualization..]

#let code=read("../Codes/web-app/app.jl")
#raw(code, lang: "julia")


#let code=read("../Codes/web-app/app.jl.html")
#raw(code, lang: "html")

we add two extra sliders that modify the behaviour of the sine wave graph:
	+ _Phase_ ranging between $-pi$ and $pi$, changes by a step of $pi/100$
*HTML:*
```html
<div class="st-col col-12 col-sm st-module">
   <p><b>Phase</b></p>
   <q-slider v-model="ph" 
   :min="-3.141" :max="3.141" :step=".0314" 
   :label="true">
   </q-slider>
    </div>
```
*Julia:*
```julia
  @in ph::Float32 = 0.0
  ...
  @onchange N, amp, freq , ph begin
  ...
  y = amp*sin.(2*π*freq*x.+ph)
```
	+ _Offset_ varies from $-0.5$ to $1$, by a step of $0.1$.
*HTML:*
```html
<div class="st-col col-12 col-sm st-module">
   <p><b>Offset</b></p>
   <q-slider v-model="off" 
   :min="-.5" :max="1" :step=".1" :label="true">
   </q-slider>
    </div>
```
*Julia:*
```julia
  @in off::Float32 = 0.0
  ...
  @onchange N, amp, freq ,off, ph begin
  ...
  y = amp*sin.(2*π*freq*x.+ph).+off
```
now we open *cmd* (command prompt) to launch the julia lancher
#figure(
	image("Images/cmd.png", width: 100%),
	caption: "Cmd",
) <fig:cmd>


```julia
cd("(location of the folder )/infodev-main/Codes/web-app")
julia> using GenieFramework
julia> Genie.loadapp() # we use this command to load the app
julia> up() # To start the server
```

We can now open the browser and navigate to the link #highlight[#link("localhost:8000")[localhost:8000]]. We will get the graphical interface as in @fig:genie-webapp.

#figure(
	image("Images/Genie-sinewave.png", width: 100%),
	caption: "Genie -> Sine Wave",
) <fig:genie-webapp>



