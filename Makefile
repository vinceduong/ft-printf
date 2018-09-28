# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apoque <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/15 15:03:55 by apoque            #+#    #+#              #
#    Updated: 2018/09/14 11:59:46 by carmenia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

CFLAGS = -Werror -Wextra -Wall

NAME = libftprintf.a

INC = ft_printf.h

SRC =main.c\
	 ft_printf.c\
	 ft_text_parser.c\
	 ft_treatement.c\
	 ft_print_chars.c\
	 ft_options.c\
	 ft_option_utilities.c\
	 
HANDLERS =	ft_i.c\
			ft_li.c\
			ft_o.c\
			ft_u.c\
			ft_x.c\
			ft_p.c\
			ft_b.c\
			ft_wstr.c\
			ft_str.c\
			ft_char.c\
			ft_conv_wchar.c\

HANDLERSRC	= $(addprefix handlers/, $(HANDLERS))

OBJ = $(SRC:.c=.o)
HANDLEROBJ = $(HANDLERSRC:.c=.o)

all : $(NAME)

$(OBJ): %.o: %.c
	@gcc -c $(CFLAGS) $< -o $@

$(HANDLEROBJ): %.o: %.c
	@gcc -c $(CFLAGS) $< -o $@

$(NAME) : $(HANDLEROBJ) $(OBJ) libft/*.c libft/Makefile
	@make -C libft
	@cp libft/libft.a ./$(NAME)
	@ar -rc $(NAME) $(OBJ) $(HANDLEROBJ)
	@ranlib $(NAME)
	@$(CC) $(FLAGS) $(OBJ) $(HANDLEROBJ) -o printf $(NAME)
	@echo "\033[32mGeneral Objects created\033[0m"
	@echo "\033[32mHandler Objects created\033[0m"

clean :
	@cd libft ; make clean ; cd ..
	@rm -rf $(OBJ) $(HANDLEROBJ)
	@echo "\033[32mRemoved Object files\033[0m"

fclean : clean
	@cd libft ; make fclean ; cd ..
	@rm -rf libftprintf.a
	@echo "\033[32mRemoved Object files and library\033[0m"

re : fclean all

.PHONY: all clean fclean re
