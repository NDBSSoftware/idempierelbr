/*
 * Copyright 2006 Sun Microsystems, Inc.  All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *   - Neither the name of Sun Microsystems nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package org.idempierelbr.nfe.process;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.SocketTimeoutException;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.logging.Level;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.CLogger;
import org.idempierelbr.nfe.model.MLBRNFeWebService;

/**
 * 	ProcGenerateCert
 *	
 *  @author Mario Grigioni
 *  @version $Id: ProcGenerateCert.java, 28/01/2011 09:52 mgrigioni Exp $
 */
public class ProcGenerateNFeWebServiceCert extends SvrProcess
{
	private String p_envType  = "1"; //Production
	
	/** Log				*/
	private static CLogger log = CLogger.getCLogger(ProcGenerateNFeWebServiceCert.class);
	
	/**
	 * 	Prepare
	 */
	protected void prepare ()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else if(name.equals("LBR_NFeEnv"))
			{
				p_envType = para[i].getParameter().toString();
			}
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
	}	//	prepare

	/**
	 * 	Process
	 *	@return Info
	 *	@throws Exception
	 */
	protected String doIt() throws Exception
	{
		String[] passphrases = MLBRNFeWebService.getURL(p_envType);
		File file = generateCertificate(passphrases);
		
		if (file != null) {
			this.processUI.download(file);
			return "OK";
		} else {
			throw new AdempiereException("Could not generate certificate");
		}
	}
	
	private static File generateCertificate(String[] passphrases) throws Exception
	{
		File file = File.createTempFile("cert_", ".keystore");
				
		for(String passphrase : passphrases){
		
			//String load = FilePath + FileName;

			//if (!file.exists())
			//	load = null;
			
			String[] conexao = passphrase.split(":");
			
			char[] store = ("changeit").toCharArray();
			
			String host = conexao[0];
			int    port = (conexao.length == 1) ? 443 : Integer.parseInt(conexao[1]);
			
			KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
			ks.load(null, store);
		
			SSLContext context = SSLContext.getInstance("TLS");
			TrustManagerFactory tmf =
			    TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
			tmf.init(ks);
			X509TrustManager defaultTrustManager = (X509TrustManager)tmf.getTrustManagers()[0];
			SavingTrustManager tm = new SavingTrustManager(defaultTrustManager);
			context.init(null, new TrustManager[] {tm}, null);
			SSLSocketFactory factory = context.getSocketFactory();
		
			System.out.println("Opening connection to " + host + ":" + port + "...");
			SSLSocket socket = (SSLSocket)factory.createSocket(host, port);
			socket.setSoTimeout(10000);
			try {
			    System.out.println("Starting SSL handshake...");
			    socket.startHandshake();
			    socket.close();
			    System.out.println();
			    System.out.println("No errors, certificate is already trusted");
			} catch (SocketTimeoutException eTimeout){
				continue;
			} catch (SSLException e) {
			    System.out.println("Certificate chain needed");
			    //e.printStackTrace(System.out);
			}
		
			X509Certificate[] chain = tm.chain;
			if (chain == null) {
			    System.out.println("Could not obtain server certificate chain");
			    log.log(Level.WARNING, "Could not obtain server certificate chain");
			    return null;
			}
		
			System.out.println();
			System.out.println("Server sent " + chain.length + " certificate(s):");
			System.out.println();
			MessageDigest sha1 = MessageDigest.getInstance("SHA1");
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			for (int i = 0; i < chain.length; i++) {
			    X509Certificate cert = chain[i];
			    System.out.println
			    	(" " + (i + 1) + " Subject " + cert.getSubjectDN());
			    System.out.println("   Issuer  " + cert.getIssuerDN());
			    sha1.update(cert.getEncoded());
			    System.out.println("   sha1    " + toHexString(sha1.digest()));
			    md5.update(cert.getEncoded());
			    System.out.println("   md5     " + toHexString(md5.digest()));
			    System.out.println();
			}
		
			System.out.println("Enter certificate to add to trusted keystore");
			int k = 0;
		
			X509Certificate cert = chain[k];
			String alias = host + "-" + (k + 1);
			ks.setCertificateEntry(alias, cert);
		
			OutputStream out = new FileOutputStream(file);
			ks.store(out, store);
			out.close();
			
			System.out.println();
			System.out.println(cert);
			System.out.println();
			System.out.println ("Added certificate to keystore " + file.getName() + " using alias '" + alias + "'");
		}
		
		return file;
	}

    private static final char[] HEXDIGITS = "0123456789abcdef".toCharArray();

    private static String toHexString(byte[] bytes) {
    	StringBuilder sb = new StringBuilder(bytes.length * 3);
    	for (int b : bytes) {
    		b &= 0xff;
    		sb.append(HEXDIGITS[b >> 4]);
    		sb.append(HEXDIGITS[b & 15]);
    		sb.append(' ');
    	}
    	return sb.toString();
    }


	private static class SavingTrustManager implements X509TrustManager {
	
		private final X509TrustManager tm;
		
		private X509Certificate[] chain;
	
		SavingTrustManager(X509TrustManager tm) {
		    this.tm = tm;
		}
	
		public X509Certificate[] getAcceptedIssuers() {
		    throw new UnsupportedOperationException();
		}
	
		public void checkClientTrusted(X509Certificate[] chain, String authType)
			throws CertificateException {
		    throw new UnsupportedOperationException();
		}
	
		public void checkServerTrusted(X509Certificate[] chain, String authType)
			throws CertificateException {
		    this.chain = chain;
		    tm.checkServerTrusted(chain, authType);
		}
	}
		
}