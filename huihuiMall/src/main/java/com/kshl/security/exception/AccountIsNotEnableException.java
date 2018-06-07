package com.kshl.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * Created by Administrator on 2017/6/21.
 */
public class AccountIsNotEnableException extends AuthenticationException {
    public AccountIsNotEnableException(String msg, Throwable t) {
        super(msg, t);
    }

    public AccountIsNotEnableException(String msg) {
        super(msg);
    }
}
