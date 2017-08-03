                                                                                         ______________________________________________________________________________
                                                                                        |              |
                                                                                        | 7.-          | Edición, compilación, depuración
                                                                                        |______________|
                    ٩(◠◡◠)۶ 


 





                                                    :split

                                                    :vsplit

                                                    :diffthis

                                                    :tabnew

                                                    :make %:r
                                                            set makeprg =LANGUAGE=en\ CFLAGS='-g\ -Wall'\ make\ %:r
                                                            set makeprg =javac\ %
                                                            set makeprg =$VIMRUNTIME/tools/efm_perl.pl\ -c\ %\ $*

                                                    :! gcc
