package Produtos

import net.sf.jasperreports.engine.JRDataSource
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import org.codehaus.groovy.grails.commons.ApplicationAttributes
import net.sf.jasperreports.engine.JasperExportManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperRunManager

import org.codehaus.groovy.grails.plugins.jasper.*

class RelProtudosController {
    def index = { 
        //caminho para o relatorio
                
        String file =
                grailsAttributes.getApplicationContext().getResource("/relatorio/produtos.jasper").getFile().toString()
   
        //cria uma o qual vai conter todas os parametros do relatório
        HashMap<String,String> parameters = new HashMap<String,String>();
        parameters.put('param',8l)

        // a variavel dados vai conter todos os dados
        ArrayList<Produto> dados = Produto.list()
                        
        //cria um datasource do jasper o qual vai armazenar todos os nossos dados
        ArrayList<Produto> coca = Produto.findAllByDescricao('COCA COLA')

        JRDataSource jdatasource = new JRBeanCollectionDataSource(coca);        

        //gera o relatório em pdf e o retorno vai em bytes              
        byte[] impressao = JasperRunManager.runReportToPdf(file, parameters, jdatasource)

        //indica que a saída será um arquivo pdf
        response.setContentType("application/pdf");
        response.setHeader("Content-disposition", "inline; filename=teste.pdf");
        // redireciona para a saída o arquivo em memória
        response.outputStream << impressao    
    }   
}
