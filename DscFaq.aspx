<%@ Page Title="DSC FAQ" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="DscFaq.aspx.cs" Inherits="DscFaq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid">
        <div class="col-md-8 col-md-offset-2 text-justify">
            <h1>DSC FAQ</h1>
            <b>Q1. What is Cryptography?</b>
            <p>
                Cryptography is the science of enabling secure communications between a sender and one or more recipients.
                This is achieved by the sender scrambling a message (with a computer program and a secret key) and leaving
                the recipient to unscramble the message (with the same computer program and a key, which may or may not be
                the same as the sender's key).
            </p>
            <p>
                There are two types of cryptography: Secret/Symmetric Key Cryptography and Public Key Cryptography.
                Secret key (symmetric/conventional) cryptography - is a system based on the sender and receiver of a
                message knowing and using the same secret key to encrypt and decrypt their messages. One weakness of this
                system is that the sender and receiver must trust some communications channel to transmit the secret key to
                prevent from disclosure. This form of cryptography ensures data integrity, data authentication and
                confidentiality.
            </p>
            <p>
                Public key (asymmetric) cryptography - is a system based on pairs of keys called public key and private key.
The public key is published to everyone while the private key is kept secret with the owner. The need for a
sender and a receiver to share a secret key and trust some communications channel is eliminated. This concept
was introduced in 1976 by Whitfield Diffie and Martin Hellman.
            </p>
            <p>
                The Digital Signatures created using the private key ensure data integrity, data authentication and nonrepudiation.
However, to ensure confidentiality, encryption of the data has to be done with the recipient’s public
key.
            </p>

            <b>Q2. How do I get a Digital Signature Certificate?</b>
            <p>
                The Office of Controller of Certifying Authorities (CCA), issues Certificate only to Certifying Authorities. The CAs
in turn issue Digital Signature Certificates to the end-users. You can approach any of the CAs for getting the
Digital Signature Certificate. For more information about the respective CAs kindly visit their websites (provided
below)
            </p>
            <pre>            
Name of CA Website
Safescrypt www.safescrypt.com
National Informatics Centre www.nic.in
Institute for Development and Research in Banking
Technology (IDRBT) www.idrbtca.org.in
TCS CA services www.tcs-ca.tcs.co.in
MTNL CA services www.mtnltrustline.com
(n) Code Solutions www.ncodesolutions.com
eMudhra www.e-Mudhra.com
</pre>

            <b>Q3. What is a Certifying Authority (CA)?</b>
            <p>
                CA is a trusted third party willing to verify the ID of entities and their association with a given key, and later
issue certificates attesting to that identity. In the passport analogy, the CA is similar to the Ministry of External
Affairs, which verifies your identification, creates a recognized and trusted document which certifies who you
are, and issues the document to you.
            </p>

            <b>Q4. Who are the CAs licensed by the CCA?</b>
            <pre>
 a. Safescrypt
 b. NIC
 c. IDRBT
 d. TCS
 e. MtnlTrustline
 f. GNFC
 g. e-MudhraCA
     </pre>
            <b>Q5. If CA is out of business then if the subscriber is told to move to another CA then the
subscriber has to get a new digital certificate. What happens to his/her earlier transactions?
Does this not create a legal and financial problem?</b>
            <p>
                Prior to cessation of operations the CA has to follow procedures as laid down under the IT Act. Such problems
should not therefore exist.
            </p>

            <b>Q6. Can one authorize someone to use DSC?</b>
            <p>
                Incase a person wants to authorize someone else to sign on his/her behalf, than the person being authorized
should use their own PKI credentials to sign the respective documents.
            </p>

            <b>Q7. Can a person have two digital signatures say one for official use and other one for
personal use?</b>
            <p>Yes.</p>

            <b>Q8. In paper world, date and the place where the paper has been signed is recorded and court
proceedings are followed on that basis. What mechanism is being followed for dispute
settlements in the case of digital signatures?</b>
            <p>
                Under the IT Act, 2000 Digital Signatures are at par with hand written signatures. Therefore, similar court
proceedings will be followed.
            </p>


            <b>Q9. Is there a "Specimen Digital Signature" like Paper Signature?</b>
            <p>No. The Digital signature changes with content of the message.</p>

            <b>Q10. If somebody uses others computer, instead of his own computer, then is there any
possibility of threat to the security of the owners/users digital signature?</b>
            <p>
                No, there is no threat to the security of the owner / users digital signature, if the private key lies on the smartcard
/crypto token and does not leave the SmartCard/crypto token.
            </p>

            <b>Q11. Is it possible for someone to use your Digital Signature without your knowledge?</b>
            <p>
                It depends upon the how the signer has kept his private key. If private key is not stored securely, then it can be
misused without the knowledge of the owner. As per the IT Act 2000, the owner of the private key will be held
responsible in the Court of Law for any electronic transactions undertaken using his/her PKI
credentials(public/private keys).
            </p>

            <b>Q12. When you cancel an earlier communication you can get it back, how does this work in environment?</b>
            <p>
                new message saying that the current message supersedes the earlier one can be sent to the recipient(s). This
assumes that all messages are time stamped.
            </p>

            <b>Q13. When can a DSC be revoked?</b>
            <p>The DSC can be revoked when an officer is transferred, suspended or his/her key is compromised.</p>

            <b>Q14. How do digital certificates work in e-mail correspondence?</b>
            <p>
                Suppose Sender wants to send a signed data/message to the recipient. He creates a message digest (which
serves as a "digital fingerprint") by using a hash function on the message. Sender then encrypts the
data/message digest with his own private key. This encrypted message digest is called a Digital Signature and
is attached to sender's original message, resulting in a signed data/message. The sender sends his signed
data/message to the recipient.
            </p>
            <p>
                When the recipient receives the signed data/message, he detaches sender's digital signature from the
data/message and decrypts the signature with the sender's public key, thus revealing the message digest.
The data/message part will have to be re-hashed by the recipient to get the message digest. The recipient then
compares this result to the message digest he receives from the sender. If they are exactly equal, the recipient
can be confident that the message has come from the sender and has not changed since he signed it. If the
message digests are not equal, the message may not have come from the sender of the data/message, or was
altered by someone, or was accidentally corrupted after it was signed.
            </p>

            <b>Q15. How do Digital Certificates work in a web site?</b>
            <p>
                When a Certificate is installed in a web server, it allows users to check the server's authenticity (server
authentication), ensures that the server is operated by an organization with the right to use the name associated
with the server's digital certificate. This safeguard's the users from trusting unauthorized sites.
A secure web server can control access and check the identity of a client by referring to the client certificate
(client authentication), this eliminates the use of password dialogs that restrict access to particular users.
The phenomenon that allows the identities of both the server and client to be authenticated through exchange
and verification of their digital certificate is called mutual server-client authentication. The technology to ensure
mutual server-client authentication is Secure Sockets Layer (SSL) encryption scheme.
            </p>

            <b>Q16. What clause an eGovernance project should have to ensure that the PKI implementation
meets the requirement of the IT Act 2000?</b>
            <p>
                The eGovernance applications have to be developed in compliance with RFC5280 certificate profile. A number
of commercial and open source PKI toolkits are available which can be used to develop a standard validation
process. Eg : - Microsoft CNG, Sun Java Toolkit. Please refer to Annexure IV of the Digital Signature Certificate
Interoperability Guidelines (http://cca.gov.in/rw/pages/index.en.do) for further details.
            </p>

            <b>Q17. Can I use the certificate issued by a CA across eGovernance applications ?</b>
            <p>Yes.</p>


            <b>Q18. What are the key sizes in India?</b>
            <p>
                CA Key is 2048 bits and the end user keys are 1024 bits. However from 1 Jan 2011, the end user keys will be
2048 bits as well as per the notification by CCA.
            </p>

            <b>Q19. What is the size of digital signatures?</b>
            <p>
                The size of the Digital Signatures varies with the size of the keys used for generation of the message digest or
hash. It can be a few bytes.
            </p>

            <b>Q20. What is the Key Escrow?</b>
            <p>
                Key escrow (also known as a fair cryptosystem) is an arrangement in which the keys needed to decrypt
encrypted data are held in escrow so that, under certain circumstances, an authorized third party may gain
access to those keys. These third parties may include businesses, who may want access to employees' private
communications, or governments, who may wish to be able to view the contents of encrypted communications.
            </p>

            <b>Q21. What are the documents accepted by NIC – CA for verification?</b>
            <p>Any of the following id’s are accepted by NIC-CA for verification of CSR</p>
            <pre>
• Employee ID
• Passport Number
• Pan Card Number
• Driving License Number
• PF Number
• Bank Account Details
• Ration Card No
                </pre>

            <b>Q22. How do applications use the CRLs?</b>
            <p>
                The applications download the CRLs from the respective CA sites at a specified frequency. The applications
than verify the public keys against this CRL at the time of Digital Signature verification. The CCA is in the
process of implementation of the OCVS (Online Certificate Verification Service) . This will ensure online
verifications of the CRLs by the applications.
            </p>

            <b>Q23. How long do the CAs’ in India preserve the Public Keys of the end users?</b>
            <p>
                As per the IT Act 2000, each CA is stores the Public Key in their repository for a period of 7 years from the date
of expiration of the Certificate.
            </p>

            <b>Q24. Should e-Governance applications archive the Digital Signature Certificates as well?</b>
            <p>
                In view of the fact that the CAs have a mandate to save the DSCs for a period of 7 years, it may be advisable for
the egovernance applications which would need to verify the records for authenticity for periods beyond 7 years.
            </p>

            <b>Q25. Can I have multiple Digital Signatures to a document?</b>
            <p>
                Yes one can have multiple Digital Signatures to a document. For eg: - in the MCA21 application the forms are
signed by different Directors as part of the application workflow.
            </p>

            <b>Q26. What are the types of applications that should use Digital Signatures?</b>
            <p>
                The eGovernance applications mainly provide:
            </p>
            <pre>
1. Information Services
2. Interactive Services (downloading of forms etc)
3. Transaction Services with or without payments like issuance of various Certificates etc
The category 3 services (transaction based) can benefit from the use of digital signatures. In general wherever a
eGovernance application requires handwritten signatures during the workflow of a document in the approval
process, we should replace them with Digital Signatures.
                </pre>

            <b>Q27. What are cryptotokens?</b>
            <p>They are hardware security tokens used to store cryptographic keys and certificates. Eg :- USB etc</p>


            <b>Q28. What are the different ways of authenticating content of digitally signed documents
issued to the citizen?</b>
            <p>
                There are different ways of verifying the content and the digital signatures of the document. Some of the
            </p>
            <p>
                mechanism are enlisted below:-
            </p>
            <p>
                1. Via Unique Request ID (manual content verification only) - In this process the user can verify the validity
of his/her document by logging onto the Department website and providing the unique request number printed
on the document. The Department application will display the electronic version of the document stored in the
application repository. However in this process since the digital signature on the document is not verified, the
contents have to be verified manually by the user by comparing the online document from the website with the
hardcopy of the document. This process thus provides content verification only. The verification of the Digital
Signature does not take place in this process.
            </p>
            <p>
                2. Verification by the 2D Barcode – In this process, the barcode printed at the bottom of the document is used
for the digital signature verification. The barcode has the Digital Signature embedded in it. The two verification
mechanisms enlisted below verify the Digital Signature only. Since the complete content of the document is not
being scanned, the content verification has to be done manually.
            </p>
            <p>
                a) Online Verification
            </p>
            <p>
                In this process, a barcode reader is used to scan the 2-D bar code printed at the bottom of the certificate. The
verification utility of the Departmental application would verify the digital signature embedded in the document
and after successful verification, show the corresponding electronic record on their website. However the user
needs to compare the contents of the electronic record and the hardcopy. This method requires a computer, an
internet connection and a 2D bar code reader.
            </p>
            <p>b) Offline Verification</p>
            <p>
                In this process, the user can verify the digital signature embedded in the barcode without connecting to the
Department website. Thereby this process is called as “offline” verification. The user needs to download and
install the verification utility custom developed by the Department (downloadable from their website). The user
also needs to download the root chain certificates of CCA and NIC and the public key of the authorised taluka
and the taluka official onto the computer. Once these items are installed on the computer, the user can scan the
2D barcode on the document and the verification utility will check the validity of the digital signature embedded
in the document thereby proving the authenticity of the document. However, the content of the hardcopy of the
document will have to be manually verified by the comparing with the electronic version available at the
Department website as the content of the hardcopy is not being scanned in this process.
            </p>

            <b>Q29. How can a digitally signed document be verified after the DSC associated with the Public
Key has expired?</b>
            <p>
                The digital signature verification process for a document requires the public key, root chains and the CRL. The
eGovernance application should therefore have a repository of public key certificates, root chains and the CRL’s
of the time the document was digitally signed. The CA’s as of now are mandated to store the Digital Signature 36
Certificates, root chains and the CRLs for a period of 7 years as per the Rules of the IT Act. Therefore the
Digital Signature Certificates can be downloaded from the CAs for a period of 7 years. However, if the digital
signature on the document needs to be verified after this period, the eGovernance applications will have to have
a provision to store the DSCs, root chains and the CRLs in a repository and undertaking the verification of
digitally signed document against this repository. However, it may be a cumbersome process to get the CRLs’
from the respective CAs for a specific period ( in the past).
            </p>

            <b>Q30. How can Departments ensure that their Government officers authorized to sign the
Certificates do not misuse their Digital Signature Certificates after being transferred from a
given place?</b>
            <p>
                It is recommended that as part of the handing over of charge of a given officer, the DSC issued to the officer be
revoked. Further his user credentials in the respective eGovernance applications should be deactivated so that
he can no longer access the application while the Certificate revocation is under process with the CA. Once the
DSC is successfully revoked, the officer will be no longer able to sign the documents.
            </p>


            <b>Q31. How can a citizen be assured that the document has been digitally signed by the
appropriate authorized Government officer?</b>
            <p>
                In order to ensure that the documents are signed by authorized individuals only, the Departments should
maintain a repository having a mapping between the DSC and the respective roles assigned to the officers of
the Departments. The eGovernance application should check against this repository for the various documents
before allowing an officer to digitally sign the document. This mechanism has been implemented in MCA21
application wherein multiple directors sign the eforms for the application. The key challenge with this approach
is to be able to maintain an updated repository at all times.
            </p>
            <p>
                The Government of India is currently looking into the proposal for creation of a central repository of Digital
Signature Certificates and CRLs’ in order to ensure that digitally signed documents can be verified at a later
date ( greater than 7 years).
            </p>
        </div>
    </div>
</asp:Content>

