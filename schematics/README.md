# PCB Fabrication at Home
This is a series of notes for me when I'm fabricating at home, so that I don't make the same mistakes next time. This was originally coming from PocketFarm-related experiences.

All of these are in a Philippine setting, and so will occasionally mention Philippine-based stores and retailers.

---

## Prerequisites
Most of the links here are from online stores, but they're usually _waaay_ cheaper when bought directly in-store (I think it's because the include the shipping costs with the product already, which isn't cost-effective when you're buying a lot from the same store; marketing tactics).
### Basic Stuff (buy and cut the board first!)
* a drill (_I use a Dremel 4000_)
* drill bits (_0.8mm, 1.0mm, 2.5mm, 3.0mm_)
* cut off wheel
* Presensitized PCB (_Kinsten, from e-Gizmo_)
* developer solution (_this came with the Presensitized PCB_)
### Layouting and UV Exposure
* Tracing Paper
* Laser Printer (_Inkjet apparently is equally fine, with a few quirks_)
* DIY UV exposure box (_Diploma Frame, a bunch of UV LEDs, a switch, a DC Jack_)
* Scissors
### Developing and Etching
* Muriatic Acid (_30% Hydrochloric Acid_)
* Hydrogen Peroxide (_Agua Oxigenada, larger volumes might be fine_)
* liquid containers (_I bought a 1L plastic container for the etching solution, and peanut butter jars for the developer solution_)
* two shallow containers for the developer solution and the etching solution
* face mask (_I use both a dust mask and earloop type mask from Mercury Drug_)
* safety goggles
* nitrile gloves (_I bought an industry-grade one for reusability_)
* glass funnel (_cannot emphasize how important this is_)
* nail polish (_acetone_)
* tissue paper (_lots_)
* absorbent cotton
### Placing and Soldering the Components
* soldering iron with a temperature knob (_mine came from China but [this](https://www.lazada.com.ph/adjustable-soldering-iron-60w-yihua-947-iii-8855270.html?spm=a2o4l.searchlist.list.2.34bd5748oZhjub) is basically it_)
* soldering [iron tip](https://www.makerlab-electronics.com/product/type-b-soldering-iron-tip/)
* solder (_Super Rubicon, 1 roll, 60%, 1.0m/m_)
* lead free tip tinner (_[Edsyn LT-1](https://www.lazada.com.ph/edsyn-lt-1-lead-free-soldering-tip-tinner-6777194.html), this is to revitalize the soldering tip_)
* blu-tack (_I'm using cheap transparent tape in the meantime._)
* desoldering pump or desoldering wick

---

## PCB Designing and Layouting
I'm using KiCad. I'm swearing by the Getting Started manual. Since I'm only doing single-sided designs, I always use the Back Layer. Here are my Design Rules for Pcbnew.

![1]

However, the clearance and the component vias are a bit small. I need to improve on this later.

Place some text on the Back Layer, and make sure it looks inverted. Print it on tracing paper (or transparency film) on a laser printer. When using an Inkjet Printer, make sure that the tracing paper doesn't jam, or curl during the process. Wet ink makes the tracing paper curl, and you may end up with an unusuable print. 

Make sure to inspect the print quality before proceeding.

## Exposing the Photoresist
Place the tracing paper where the printed side faces the PCB later on. You can check if this is the case by looking it through the ceiling, and you can read the text. Tape it into the glass frame, and once done (assuming that the board was already pre-cut), turn off the lights, peel the protective layer, and move quickly.

Place the PCB on the frame, aligned with the printout, lock the frame, and place it on the UV exposure box. Set the timer to 1 minute and 30 seconds, and turn on the lights. While this is happening, wear all protective equipment (goggles, mask, gloves).

## Developing the Exposed Board
The developer solution can be reused. Place caution into dissolving too much into the solution. The middle part of the PCB always develops last, and when this happens too slowly, add a little bit more of the developer powder. Adding too much developer powder will eat out photoresist on areas you don't intend to, and will lead to failure.

Inspect the board visually by rising it from time to time, and make sure you get everything covered (or erased).

## Etching and Exposing the Developed Board
I'm using Cupric Chloride as etchant. Some notes.
* Pure muriatic acid etches very, very quickly. It also produces a lot of fumes, noticeably making it a little bit harder to breathe.
* In the beginning, do a 1:1 ratio of HCl and H2O2.
* Add H2O2 when the solution begins to become olive green in color. Mix well.
* Add HCl when the copper isn't removed quickly. This is usually noticeable at the edges.
* Never add chemicals directly to the board. Do it on the side, then quickly agitate the solution.
* Cupric Chloride on Aqueous Hydrochloric Acid requires reoxidation. If this is done quite frequently, invest on an aquarium air pump (this will also do the agitation necessary for the board), or add H2O2 once in a while.
* CuCl stains. Make sure tissue is in standby nearby. I use a basin below the CuCl container to collect spilling etchant.
* If the recycled etchant doesn't work very well, start with a sizeable amount, then apply more HCl. This allows for a relatively faster etching process, without the excess fumes.
* When satisfied, remove the board from the etchant, dry it with tissue paper, and remove the photoresist with acetone (nail polish). You'd want to use this with cotton balls than tissue paper as cotton holds to the acetone for a little bit longer.
* When all copper components are exposed, clean the board (front and back with alcohol).
* Remember to follow your city guidelines on hazardous waste disposal. Never, ever, try to drain your chemicals directly down the sink!

## Drilling and Cutting the Etched Board
* Dremel 4000's speed works well set to 15--for cutting, drilling, and 5/10 for polishing.
* You'll get a lot of thin drill bits breaking easily, frequently. Make sure to have a lot of backup, and maybe invest on a Multi Chuck (Dremel 4486).
* I'm using a book as a vise/clamp. Invest in a better solution.
* Most through-hole components will work with 0.8mm, but 1.0mm breaks less frequently.
* Big holes are usually of the 3.0mm variant.
* DC jacks use a 2.5mm for the GND and the Switch, and a 3.0mm for the VCC.

## Soldering Through-Hole Components to the PCB
* Use blu-tack for temporarily fastening the components before soldering.
* Make sure to use a sharp tip rather than a tip with a flat end to make soldering jobs less ugly.

---
Take care!

[1]: https://i.imgur.com/gUOFxXU.png