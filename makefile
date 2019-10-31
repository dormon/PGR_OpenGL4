SRCDIR = src/
TARGET = presentation

%.pdf: %.svg
	rsvg-convert -f pdf -o $@ $<

%.pdf: %.gplot
	gnuplot $<

pdfFromSVG =                                                                    \
  pics/framebuffer/framebuffer.pdf                                              \
  pics/physicallyBasedRendering/fresnel_reflectance.pdf                         \
  pics/physicallyBasedRendering/fresnel_reflectance_table.pdf                   \
  pics/physicallyBasedRendering/half.pdf                                        \
  pics/physicallyBasedRendering/metal_refraction.pdf                            \
  pics/physicallyBasedRendering/microfacets_occlusion.pdf                       \
  pics/physicallyBasedRendering/microfacets_that_contribute.pdf                 \
  pics/physicallyBasedRendering/microfacet_masking.pdf                          \
  pics/physicallyBasedRendering/roughness/roughness.pdf                         \
  pics/physicallyBasedRendering/scattering_absorption1/scattering_absorption.pdf\
  pics/physicallyBasedRendering/scattering_absorption2/scattering_absorption.pdf\
  pics/physicallyBasedRendering/specular_diffuse.pdf                            \
  pics/physicallyBasedRendering/subsurface_pixel_size.pdf                       \
  pics/texture/textura.pdf                                                      \
  pics/texture/tu.pdf                                                           \
  pics/physicallyBasedRendering/shininessGraph.pdf                       




all: ${pdfFromSVG}
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	#bibtex $(TARGET)
	#pdflatex -shell-escape $(TARGET)
	#pdflatex -shell-escape $(TARGET)

clean:
	rm -rf *.aux *.pdf *.log *.toc *.bbl *.blg *.out *.nav *.snm *.pyg *.vrb _minted-presentation ${pdfFromSVG}
