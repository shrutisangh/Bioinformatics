# PyMOL script for PDB 2OCJ (human p53 core domain, DNA-free)
# Run after: fetch 2OCJ

hide everything                      # hide default representation
show cartoon, chain A                # protein as ribbon cartoon
show cartoon, chain B+C+D            # other three copies
color marine, chain A                # chain A = navy blue
color orange, chain B+C+D            # other copies = orange
show spheres, resn ZN                # zinc as sphere
color yellow, resn ZN                # zinc = yellow
zoom                                 # fit structure to window
ray                                  # render high-quality image
png p53_structure.png                # save rendered image
spectrum b, rainbow, chain A         # blue = rigid, red = flexible (B-factor)
