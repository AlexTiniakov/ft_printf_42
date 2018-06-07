#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otiniako <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/16 20:13:41 by otiniako          #+#    #+#              #
#    Updated: 2018/04/28 17:20:40 by otiniako         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = libftprintf.a

HEADER = ft_printf.h

#C_INCLUDE_PATH += include/ libft/include

FLAGS = -Wall -Wextra -Werror -I includes/

#FLAGS += $(foreach d, $(C_INCLUDE_PATH), -I$d)

SRC = ft_printf.c\
		ft_params.c\
		ft_null.c\
		ft_printf_procent.c\
		ft_tools.c\
		ft_printf_int.c\
		ft_printf_long.c\
		ft_printf_char.c\
		ft_printf_str.c\
		ft_printf_hex.c\
		ft_printf_octal.c\
		ft_printf_unsign.c\
		ft_printf_void.c\


LIB = ft_atoi.c ft_bzero.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c\
	ft_isprint.c ft_itoa.c ft_lstadd.c ft_lstdel.c ft_lstdelone.c ft_lstiter.c\
	ft_lstmap.c ft_lstnew.c ft_memalloc.c ft_memccpy.c ft_memchr.c ft_memcmp.c\
	ft_memcpy.c ft_memdel.c ft_memmove.c ft_memset.c ft_putchar.c ft_putchar_fd.c\
	ft_putendl.c ft_putendl_fd.c ft_putnbr.c ft_putnbr_fd.c ft_putstr.c\
	ft_strjoin_clean.c ft_wstrlen.c ft_wstrnew.c ft_putnwstr.c ft_putwchar_fd.c\
	ft_putwchar.c ft_putnstr.c ft_putnbr_base.c ft_atoi_base.c\
	ft_putstr_fd.c ft_strcat.c ft_strchr.c ft_strclr.c ft_strcmp.c ft_strcpy.c\
	ft_strdel.c ft_strdup.c ft_strequ.c ft_striter.c ft_striteri.c ft_strjoin.c\
	ft_strlcat.c ft_strlen.c ft_strmap.c ft_strmapi.c ft_strncat.c ft_strncmp.c\
	ft_strncpy.c ft_strnequ.c ft_strnew.c ft_strnstr.c ft_strrchr.c ft_strrev.c\
	ft_strsplit.c ft_strstr.c ft_strsub.c ft_strtrim.c ft_tolower.c ft_toupper.c\
	ft_putnbr_u_base_fd.c ft_putnbr_u.c



RM = rm -f

PRINTFSRCS	= $(addprefix src/, $(SRC))
LIBSRCS	= $(addprefix libft/, $(LIB))

OBJ = $(PRINTFSRCS:.c=.o)
LIBOBJ = $(LIBSRCS:.c=.o)

all: $(NAME)

$(OBJ): %.o: %.c
	@gcc -c $(FLAGS) $< -o $@

$(LIBOBJ): %.o: %.c
	@gcc -c $(FLAGS) $< -o $@

$(NAME): $(LIBOBJ) $(OBJ)
	@ar rcs $(NAME) $(OBJ) $(LIBOBJ)


clean: 
	@make -C libft/ clean
	@rm -f $(OBJ)

fclean: clean
	@rm -rf $(NAME)
	@make -C libft/ fclean

re: fclean all

main: re
	@gcc main.c -L. -lftprintf